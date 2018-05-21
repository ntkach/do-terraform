##Set up a terraform state file for here on the s3 backend
#Note that "region" here is where the bucket was created
terraform {
  backend "s3" {
    encrypt = true
    bucket = "TF_BUCKET"
    dynamodb_table = "terraform-locks"
    region = "MAIN_REGION"
    key = "global/terraform.tfstate"
  }
}
