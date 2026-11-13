<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_cloudavenue"></a> [cloudavenue](#requirement\_cloudavenue) | >=0.20.0 |  

## Resources

| Name | Type |
|------|------|
| [cloudavenue_vdc.vdc](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/vdc) | resource |
| [cloudavenue_vdc_acl.vdc_acl](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/vdc_acl) | resource |
| [cloudavenue_iam_user.acl_users](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/data-sources/iam_user) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vdc"></a> [vdc](#input\_vdc) | n/a | <pre>object({<br/>    billing_model         = optional(string, "PAYG")<br/>    cpu_allocated         = optional(number, 22000)<br/>    cpu_speed_in_mhz      = optional(number, 2200)<br/>    description           = optional(string)<br/>    disponibility_class   = optional(string, "ONE-ROOM")<br/>    memory_allocated      = optional(number, 30)<br/>    name                  = string<br/>    service_class         = optional(string, "STD")<br/>    storage_billing_model = optional(string, "PAYG")<br/>    storage_profiles = list(object({<br/>      class   = optional(string, "silver")<br/>      default = optional(bool, true)<br/>      limit   = optional(number, 500)<br/>    }))<br/>    acl_list = optional(list(string))<br/>  })</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vdc"></a> [vdc](#output\_vdc) | n/a |
| <a name="output_vdc_acl"></a> [vdc\_acl](#output\_vdc\_acl) | n/a |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->