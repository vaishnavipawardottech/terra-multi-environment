# key-pair (login)
resource aws_key_pair custom_key_pair {
    key_name = "${var.custom_env}-terra-automate-key-pair"
    public_key = file("${path.module}/terra-automate-key.pub")
}


# VPC & Security Group
resource aws_default_vpc default {

}

resource aws_security_group custom_security_group {
    name = "${var.custom_env}-terra-security-group"
    description = "This will add a TF relatedSecurity group"
    vpc_id = aws_default_vpc.default.id 

    # Inbound Rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow SSH from anywhere"
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP from anywhere"
    }

    # Outbound Rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }

    tags = {
        Name: "${var.custom_env}-terra-security-group"
        Environment: var.custom_env
    }
}

# ec2 instance
resource "aws_instance" "custom_instance" {
    count = var.custom_ec2_count

    ami = var.custom_ec2_ami  
    instance_type = var.custom_ec2_instance_type
    key_name = aws_key_pair.custom_key_pair.key_name

    # security_groups = [aws_security_group.custom_security_group.name]
    vpc_security_group_ids = [
        aws_security_group.custom_security_group.id
    ]
    
    

    root_block_device {
        volume_size = 15
        volume_type = "gp3"
    }
    tags = {
        Name = "${var.custom_env}-app-ec2-server-${count.index}"
        Environment = var.custom_env
    }
}