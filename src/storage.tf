

resource "crusoe_storage_disk" "data_disk" {
    name = "data-disk"
    size = "10TiB"
    location = "us-east1-a"
    type = "shared-volume"
}


resource "crusoe_storage_disk" "home_disk" {
    name = "home-disk"
    size = "1TiB"
    location = "us-east1-a"
    type = "shared-volume"
   
}


resource "crusoe_storage_disk" "slurmctld_disk" {
    name = "slurmctld-disk"
    size = "5TiB"
    location = "us-east1-a"
    type = "shared-volume"
 
}



