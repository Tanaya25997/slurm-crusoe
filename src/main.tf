terraform {
    required_providers {
        crusoe = {
            source = "registry.terraform.io/crusoecloud/crusoe"
        }
    }
}

provider "crusoe" {
    profile = var.profile
}

locals {
    ssh_key = file(var.ssh_public_key_path)  # replace with ur ssh key 
}






