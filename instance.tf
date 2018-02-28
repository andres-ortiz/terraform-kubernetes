resource "aws_instance" "kubernetes" {
    ami             = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type   = "t2.micro"

    # VPC subnet
    subnet_id   = "${aws_subnet.main-public-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

    # Publique SSH Key
    key_name = "${aws_key_pair.mykeypair.key_name}"

    provisioner "file" {
        source = "install_kub.sh"
        destination = "/tmp/install_kub.sh"
    }

    provisioner "file" {
        source = "sources.list"
        destination = "/tmp/sources.list"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo mv /tmp/sources.list /etc/apt/sources.list",
            "chmod +x /tmp/install_kub.sh",
            "sudo /tmp/install_kub.sh"
        ]
    }

    connection {
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
    
}

output "ip" {
    value = "${aws_instance.kubernetes.public_ip}"
}
