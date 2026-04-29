run "validate_disks" {

    command = plan


    assert {
        condition = crusoe_storage_disk.data_disk.size == "10TiB"
        error_message = "data disk size is not 10 TiB"
    }

    assert {
        condition = crusoe_storage_disk.home_disk.size == "1TiB"
        error_message = "home disk is not 1 TiB in size"
    }

}
