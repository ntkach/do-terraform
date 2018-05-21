#AWS Terraform
* This level would have a directory for each AWS account in your AWS Organization.  It would be easier to follow if you used account aliases like "main" for the root account and "bastion" for whatever your bastion account is, but you could use account numbers here as well.
* At this level you might have a modules account where you *temporarily* check out terraform modules while you're working on them.  Ultimately they *must* be in SCM.
* The 'main' would be where everything to set up your main root account goes.
* The 'bastion' would be where everything for your bastion account goes.
* Each account directory starts a tree where there's a 'global' directory at the top for things that apply to all VPCs in all regions (such as the backend resource creation).
* Each account directory then has a set of directories for region (us-east-2, us-west-2, etc).  Everything specific to that region goes there.  Potentially a global directory at that level for everything in that region.
* In each region directory you'd then have a set of directories for each VPC in that region.
* Within each VPC directory things start to get harder to break down.  We've been going by either "app" (like rancher-ha) or "function" (like network).

##Issues
* Need to try to figure out some way to neatly pass along "defaults" so you don't have to keep defining things like aws_region for everything in us-east-2.
