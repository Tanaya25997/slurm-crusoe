
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
    name = "allow-icmp-slurm-network"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "ingress"
    protocols = "icmp"
    source = crusoe_vpc_subnet.slurm_subnet.cidr
    source_ports = ""
    destination = crusoe_vpc_subnet.slurm_subnet.cidr
    destination_ports = ""
}

resource "crusoe_vpc_firewall_rule" "icmp_egress" {
    name = "allow-icmp-egress-slurm-network-egress"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "egress"
    protocols = "icmp"
    source = crusoe_vpc_subnet.slurm_subnet.cidr
    source_ports = ""
    destination = "0.0.0.0/0"
    destination_ports = ""
}


resource "crusoe_vpc_firewall_rule" "tcp_udp" {
    name = "allow-tcp-udp-slurm-network"
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
    name = "allow-tcp-udp-egress-slurm-network"
    network = crusoe_vpc_network.slurm_network.id
    action = "allow"
    direction = "egress"
    protocols = "tcp,udp"
    source = crusoe_vpc_network.slurm_network.cidr
    source_ports = "1-65535"
    destination =  "0.0.0.0/0"
    destination_ports = "1-65535"
}







