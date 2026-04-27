variable "ssh_public_key_path" {
    description = "The public ssh key to authorize to the cluster"
    type = string 
}

variable "cup_worker_count" {
    description = "Number of cpu workers"
    type = int
}



variable "profile" {
    description = "crusoe porfile"
    type = string
    default = "default"
}