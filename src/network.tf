
### vpc
resource "crusoe_vpc_network" "slurm_network" {
    name = "slurm-network"
    cidr = "10.0.0.0/8"
}


## subnets
resource "crusoe_vpc_subnet" "slurm_subnet" {
    name = "slurm-subnet"
    cidr = "10.0.0.0/16"
    location = "us-east1-a"
    network = crusoe_vpc_network.slurm_network.id
    nat_gateway_enabled = true
}


## firewalll rules 

resource "crusoe_vpc_firewall_rule" "icmp" {
    name = "allow_icmp_slurm_network"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "ingress"
    protocols = "icmp"
    source = crusoe_vpc_subnet.slurm_subnet.cidr
    destination = crusoe_vpc_subnet.slurm_subnet.cidr
}

resource "crusoe_vpc_firewall_rule" "icmp_egress" {
    name = "allow_icmp_egress_slurm_network_egress"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "egress"
    protocols = "icmp"
    destination = "0.0.0.0/0"
}


resource "crusoe_vpc_firewall_rule" "tcp_udp" {
    name = "allow_tcp_udp_slurm_network"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "ingress"
    protocols = "tcp,udp"
    source = crusoe_vpc_subnet.slurm_subnet.cidr
    source_ports = "1-65535"
    destination = crusoe_vpc_subnet.slurm_subnet.cidr
    destination_ports = "1-65535"
}


resource "crusoe_vpc_firewall_rule" "tcp_udp_egress" {
    name = "allow_tcp_udp_egress_slurm_network"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "egress"
    protocols = "tcp,udp"
    source = crusoe_vpc_network.slurm_network.cidr
    source_ports = "1-65535"
    destination =  "0.0.0.0/0"
    destination_ports = "1-65535"
}







