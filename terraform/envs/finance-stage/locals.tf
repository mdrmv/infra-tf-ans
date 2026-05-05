locals {
  environment = "finance-stage"

  private_bucket_name = "ngdem-finance-stage-private"
  public_bucket_name  = "ngdem-finance-stage-public"

  common_labels = {
    project     = "ngdem"
    domain      = "finance"
    environment = local.environment
    managed_by  = "terraform"
  }
}
