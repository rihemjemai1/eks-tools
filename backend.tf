terraform {
  backend "s3" {
    bucket       = "terraform-state-rihem"
    key          = "eks-tools/rihem_jemai/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}