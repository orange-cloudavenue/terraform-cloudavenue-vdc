<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >=1.0 |
| <a name="requirement_cloudavenue"></a> [cloudavenue](#requirement_cloudavenue) | 0.27.0 |

## Resources

| Name | Type |
|------|------|
| [cloudavenue_vdc.vdc](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/0.27.0/docs/resources/vdc) | resource |
| [cloudavenue_vdc_acl.vdc_acl](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/0.27.0/docs/resources/vdc_acl) | resource |
| [cloudavenue_iam_user.acl_users](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/0.27.0/docs/data-sources/iam_user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vdc"></a> [vdc](#input_vdc) | n/a | ```object({ billing_model = string cpu_allocated = number cpu_speed_in_mhz = number description = string disponibility_class = string memory_allocated = number name = string service_class = string storage_billing_model = string storage_profiles = list(object({ class = string, default = bool, limit = number, })) acl_list = list(string) })``` | ```{ "acl_list": null, "billing_model": "PAYG", "cpu_allocated": 22000, "cpu_speed_in_mhz": 2200, "description": null, "disponibility_class": "ONE-ROOM", "memory_allocated": 30, "name": null, "service_class": "STD", "storage_billing_model": "PAYG", "storage_profiles": [ { "class": "silver", "default": true, "limit": 500 } ] }``` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vdc"></a> [vdc](#output_vdc) | n/a |
| <a name="output_vdc_acl"></a> [vdc_acl](#output_vdc_acl) | n/a |
<!-- END_TF_DOCS -->