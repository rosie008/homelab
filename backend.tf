terraform {
  backend "s3" {
    bucket       = "rose-homelab-terraform-state"
    key          = "homelab/terraform.tfstate"
    region       = "ap-southeast-3"
    use_lockfile = true
    encrypt      = true
  }
}