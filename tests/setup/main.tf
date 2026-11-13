terraform {
  required_providers {
    cloudavenue = {
      source  = "orange-cloudavenue/cloudavenue"
      version = ">= 0.20.0"
    }
  }
  required_version = ">= 1.5"
}

provider "cloudavenue" {
  org = "cav01ev01ocb0001234"
}

module "vdc_example" {
  source = "./../../"

  vdc = {
    name = "my_vdc"

    storage_profiles = [
      {
        class   = "silver"
        default = true
        limit   = 1000
      },
    ]
    acl_list = []
  }
}
