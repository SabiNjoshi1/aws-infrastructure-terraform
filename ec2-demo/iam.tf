# resource "aws_iam_role" "ec2_iam_role" {
#     name = "${var.name}-iam-role"
#     assume_role_policy = <<EOF
#     {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Action": "sts:AssumeRole",
#             "Principal": {
#             "Service": "ec2.amazonaws.com"
#             },
#             "Effect": "Allow",
#             "Sid": ""
#         }
#     ]
# }
# EOF
# tags = merge(
#     var.tags,
#     {
#         name = "${var.name}-iam-role"
#     }
# )
# }

# resource "aws_iam_instance_profile" "ec2_profile" {
#     name = "${var.name}-instance-profile"
#     role = aws_iam_role.ec2_iam_role.name

# }

# resource "aws_iam_role_policy" "ec2_iam_policy" {
#   name = "${var.name}-iam-role-policy"
#   role = aws_iam_role.ec2_iam_role.name
#   policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": [
#         "ec2:DescribeInstances",
#         "ec2:DescribeImages",
#         "ec2:DescribeTags",
#         "ec2:StartInstances",
#         "ec2:StopInstances",
#         "ec2messages:DeleteMessage"
#       ],
#       "Effect": "Allow",
#       "Resource": "*"
#     }
#   ]
# }
# EOF
# }