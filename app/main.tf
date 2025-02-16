provider "aws" {
    region                    = "us-east-1"
    shared_credentials_files  = ["C:/Users/user/Documents/docs/terraform:aws_credentials"]
}

# Cretion du sg
module "sg" {
    source = "../modules/sg"
}

# Creation du volume 
module "ebs" {
    source = "../modules/ebs"
    disk_size = 5
}

# Creation de l'EIP 
module "eip" {
    source = "../modules/eip"
}

# Creation de l'ec2
module "ec2" {
    source = "../modules/ec2"
    instance_type = "t2.nano"
    public_ip = module.eip.output_eip
    sg_name = module.sg.output_sg_name
}

# Creation des associations
resource "aws_eip_association" "eip_assoc" {
    instance_id   = module.ec2.output_ec2_id
    allocation_id = module.eip.output_eip_id
}

resource "aws_volume_attachement" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id   = module.ebs.output_id_volume
    instance_id = module.ec2.output_ec2_id
}