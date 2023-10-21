resource "aws_key_pair" "app_key" {
  key_name = var.ssh_key_pair_name
  public_key = file(var.ssh_key_pair_public_key_path)
}

resource "aws_security_group" "app_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.load_balancer_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "app_launch_template" {
  name = var.app_launch_template_name
  image_id = var.app_launch_template_image_id
  instance_type = var.app_launch_template_instance_type
  key_name = aws_key_pair.app_key.key_name

  vpc_security_group_ids = [aws_security_group.app_sg.id]

  iam_instance_profile {
    name = var.s3_dynamodb_profile_name
  }

  user_data = base64encode(templatefile("${path.module}/app_script.sh.tpl", {
    employe_photo_bucket_bucket = var.app_bucket_bucket
  }))

  tags = var.tags
}
