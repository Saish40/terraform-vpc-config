resource "aws_security_group" "sg" {
    name = "SG"
    vpc_id = aws_vpc.vpc.id
    depends_on = [ aws_vpc.vpc ]
    ingress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = 22
            to_port = 22
            protocol = "tcp"
            description = ""
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
    egress = [
        {
            cidr_blocks = ["0.0.0.0/0"]
            from_port = 0
            to_port = 0
            protocol = "-1"
            description = ""
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
  
}