resource "aws_iam_role_policy" "mrpid_sfn_access_partner_s3_policy" {
  name = "mrpid-sfn-access-partner-s3-policy-${var.pce_instance_id}"

  role = aws_iam_role.mrpid_publisher_sfn_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::mrpid-partner-${var.partner_unique_tag}/*",
        "arn:aws:s3:::mrpid-partner-${var.partner_unique_tag}"
      ]
    }
  ]
}
EOF
}
