# AWS
region = "us-west-2"

tags = {
  Product           = "ETS sandbox"
  ProductCategory   = "training"
  ProductFamily     = "unmanaged "
  TechContact       = "sabbe"
  BillingCostCenter = "unknown"
  AdminContact      = "unknown"
  BillingProgram    = "unknown"
  Lifecycle         = "unknown"
  Repo              = "https://github.com/sabbe-ets/terraExplore"
}

# asu IP modules
module "asu-ips" {
  source = "https://github.com/ASU/dco-terraform/tree/0.13/modules/asu-ips"
}

