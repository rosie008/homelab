module "networking" {
  source = "./modules/networks"

  project_name = "rose-homelab"

  vpc_cidr_block = "10.2.0.0/16"

    nat_network_interface_id = module.nat-instance.network_interface_id

}


module "security" {
    source = "./modules/security"
    
    project_name = "rose-homelab"
    private_subnet_cidr = module.networking.private_subnet_cidr
    vpc_id = module.networking.vpc_id 
    vpc_cidr = module.networking.vpc_cidr_block
  
}


module "ami" {
  source = "./modules/ami"
  filter_name = "ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-*"
}


module "nat-instance" {
    source = "./modules/nat-instance"

    ami_id = module.ami.ami_id
    project_name = "rose-homelab"
    vpc_id = module.networking.vpc_id
    instance_type = "t3.nano"
    subnet_id = module.networking.public_subnet_id
    iam_instance_profile = module.security.iam_instance_profile
    security_group_id = module.security.nat_instance_sg_id  
  
}