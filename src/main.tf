terraform {
    required_providers {
        crusoe = {
            source = "registry.terraform.io/crusoecloud/crusoe"
        }
    }
}

locals {
    ssh_key = file("~/.ssh/id_ed25519.pub")  # replace with ur ssh key 
}