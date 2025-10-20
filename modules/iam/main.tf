module "apps" {
  source = "./apps"


  providers = {
    aws.eu = aws.eu
    aws.us = aws.us
  }
}
