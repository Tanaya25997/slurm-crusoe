run "validate_vpc" {
    command = plan 

    assert {
        condition = crusoe_vpc_network.slurm_network.name == "slurm-network"
        error_message = "VPC name is correct!"
    }


    assert {
        condition = crusoe_vpc_network.slurm_network.cidr == "10.0.0.0/8"
        error_message = "VPC cidr is correct"
    }

    


}