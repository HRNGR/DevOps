#rout53
resource "aws_route53_zone" "main" {
  name = "harungur.com"
}

#ec2 ile

# #rout53 record s3
# resource "aws_route53_record" "main" {
#   zone_id = aws_route53_zone.main.zone_id
#   name    = "example.com"
#   type    = "A"

#   alias {
#     name                   = aws_s3_bucket.Website_Bucket.dns_name
#     zone_id                = aws_s3_bucket.Website_Bucket.zone_id
#     evaluate_target_health = true
#   }
# }

#rout53 record ec2
resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.harungur.com"
  type    = "A"
  ttl     = "60"
  records = [aws_instance.Personal_Website.public_ip]
}


resource "aws_security_group" "webserverSG" {
  name        = "Web_Server_Security_Group"
  description = "Accept HTTP and SSH Traffic"
  vpc_id      = var.vpc_id # lookup(var.awsprops, "vps_id")
  //To Allow Port 22 SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  //To Allow Port 80 HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  //From Allow TLS
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "webserverSG"
  }
}
data "aws_ami" "tf_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "Personal_Website" {
  ami                    = data.aws_ami.tf_ami.id
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_security_group_ids = [aws_security_group.webserverSG.id]
  user_data              = file("./scrip.sh")
  tags = {
    "Name" = "Personal_Website"
  }
}

# #-------------------------------------------------------------


# #s3 ile


# #s3
# resource "aws_s3_bucket" "Website_Bucket" {
#   bucket = "www.harungur.com"
#   acl    = "public-read"
#   policy = file("policy.json")

#   website {
#     index_document = "index.html"

#     routing_rules = <<EOF
# [{
#     "Condition": {
#         "KeyPrefixEquals": "docs/"
#     },
#     "Redirect": {
#         "ReplaceKeyPrefixWith": "documents/"
#     }
# }]
# EOF
#   }
# }

# # #s3 configuration
# resource "aws_s3_bucket_website_configuration" "Website_Bucket" {
#   bucket = aws_s3_bucket.Website_Bucket.bucket

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }

#   routing_rule {
#     condition {
#       key_prefix_equals = "docs/"
#     }
#     redirect {
#       replace_key_prefix_with = "documents/"
#     }
#   }
# }


# # #s3 upload

# # #uploadfromlokal
# resource "aws_s3_bucket_object" "Website_Bucket" {
# for_each = fileset("${path.module}/harungurcom/", "*")
# bucket = aws_s3_bucket.Website_Bucket.id
# key = each.value
# source = "myfiles/${each.value}"
# etag = filemd5("myfiles/${each.value}")
# }

# # resource "aws_s3_bucket_object" "Website_Bucket" {
# #   bucket = "Website_Bucket"
# #   key    = "Website_Bucket_key"
# #   source = "${path.module}/harungurcom.rar"
# #   etag   = "${filemd5("${path.module}/harungurcom.rar")}"
# # }

# # #uploadfromgithub
# # resource "aws_s3_object_copy" "Website_Bucket_copy" {
# #   bucket = "Website_Bucket"
# #   key    = "destination_key"
# #   source = "source_bucket/source_key"

# #   grant {
# #     uri         = "https://raw.githubusercontent.com/HRNGR/mywebsite/main/harungurcom/"
# #     type        = "Group"
# #     permissions = ["READ"]
# #   }
# # }




