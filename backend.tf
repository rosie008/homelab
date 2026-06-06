terraform {
  backend "s3" {
    bucket         = "rose-homelab-terraform-state"
    key            = "homelab/terraform.tfstate"
    region         = "ap-southeast-3"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}