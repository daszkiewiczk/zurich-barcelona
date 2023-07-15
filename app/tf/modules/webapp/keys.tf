resource "aws_key_pair" "zurich_webapp_key_a" {
  key_name   = "zurich_webapp_key_a"
  public_key = file("${path.module}/keys/webapp_key_a.pub")
}

resource "aws_key_pair" "zurich_webapp_key_b" {
  key_name   = "zurich_webapp_key_b"
  public_key = file("${path.module}/keys/webapp_key_b.pub")
}