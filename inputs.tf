variable "vpc_network_cidr" {
  type = string
  #default     = "10.10.0.0/16"
  description = "This is vpc network cidr range"
}

# variable "subnets_cidr_range" {
#   type        = string
#   default     = "10.10.%g.0/24"
#   description = "These are cidr network ranges"

# }

variable "subnets_names" {
  type = list(string)
  #default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "These are subnets names"

}

variable "subnet_azs" {
  type = list(string)
  # default = [ "us-west-1b", "us-west-1c" ] # we put all default values in comments here as we declare these variable values in dev.tfvars
  description = "These are subnet availability zones"

}

variable "db_subnet_names" {
  type = list(string)
  #default     = ["db1", "db2"]
  description = "These are datebase subnet names"

}

variable "websg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      protocol   = string
      cidr_block = string
      to_port    = number
      from_port  = number
    }))
  })
  # default = {
  #   name        = "websg"
  #   description = "This is web security group"
  #   rules = [{
  #     type       = "ingress"
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"
  #     to_port    = 80
  #     from_port  = 80

  #     },
  #     {
  #       type       = "ingress"
  #       protocol   = "tcp"
  #       cidr_block = "0.0.0.0/0"
  #       to_port    = 22
  #       from_port  = 22
  #     },
  #     {
  #       type       = "egress"
  #       protocol   = -1
  #       cidr_block = "0.0.0.0/0"
  #       to_port    = 65535
  #       from_port  = 0
  #     }
  #   ]
  # }
}

variable "appsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      protocol   = string
      cidr_block = string
      to_port    = number
      from_port  = number
    }))
  })
  # default = {
  #   name        = "appsg"
  #   description = "This is app security group"
  #   rules = [{
  #     type       = "ingress"
  #     protocol   = "tcp"
  #     cidr_block = "0.0.0.0/0"
  #     to_port    = 22
  #     from_port  = 22

  #     },
  #     {
  #       type       = "ingress"
  #       protocol   = "tcp"
  #       cidr_block = "10.10.0.0/16"
  #       to_port    = 8080
  #       from_port  = 8080

  #     },
  #     {
  #       type       = "egress"
  #       protocol   = -1
  #       cidr_block = "0.0.0.0/0"
  #       to_port    = 65535
  #       from_port  = 0

  #   }]
  # }
}

variable "dbsg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      protocol   = string
      cidr_block = string
      to_port    = number
      from_port  = number
    }))
  })
  # default = {
  #   name        = "dbsg"
  #   description = "This is db security group"
  #   rules = [{
  #     type       = "ingress"
  #     protocol   = "tcp"
  #     cidr_block = "10.10.0.0/16"
  #     to_port    = 3306
  #     from_port  = 3306

  #     },
  #     {
  #       type       = "egress"
  #       protocol   = -1
  #       cidr_block = "0.0.0.0/16"
  #       to_port    = 65535
  #       from_port  = 0

  #   }]
  # }
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
  # default = "C:\temp\manual_keypair\tls_keypairr\my.pub" This notation error occured, below notation workedout till fmt and validate
  #default     = "~/manual_keypair/tls_keypairr/my.pub" # but didnt worked when we did apply error is " below written"
  description = "This is my public key pair"

}

# # "╷ 
# │ Error: Invalid function argument
# │
# │   on appserver.tf line 3, in resource "aws_key_pair" "private":
# │    3:   public_key = file(var.public_key_path)
# │     ├────────────────
# │     │ while calling file(path)
# │     │ var.public_key_path is "~/manual_keypair/tls_keypairr/my.pub"
# │
# │ Invalid value for "path" parameter: no file exists at "~/manual_keypair/tls_keypairr/my.pub"; this function works
# │ only with files that are distributed as part of the configuration source code, so if this file will be created by a
# │ resource in this configuration you must instead obtain this result from an attribute of that resource."

variable "ubuntu_ami_id" {
  type    = string
  default = "ami-08012c0a9ee8e21c4"
}

variable "app_instance_size" {
  type    = string
  default = "t2.micro"

}

variable "app_subnet_name" {
  type    = string
  default = "app1"

}