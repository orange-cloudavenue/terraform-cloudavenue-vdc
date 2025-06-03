# https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/vdc
resource "cloudavenue_vdc" "vdc" {
  billing_model         = var.vdc.billing_model
  cpu_allocated         = var.vdc.cpu_allocated
  cpu_speed_in_mhz      = var.vdc.cpu_speed_in_mhz
  disponibility_class   = var.vdc.disponibility_class
  description           = var.vdc.description
  memory_allocated      = var.vdc.memory_allocated
  name                  = var.vdc.name
  service_class         = var.vdc.service_class
  storage_billing_model = var.vdc.storage_billing_model
  storage_profiles      = var.vdc.storage_profiles
  timeouts = {
    create = "10m"
    update = "10m"
    delete = "6m"
  }
}

# https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/vdc_acl
data "cloudavenue_iam_user" "acl_users" {
  for_each = length(var.vdc.acl_list) > 0 ? toset(var.vdc.acl_list) : []

  name = each.value # Each key is a user email
}

# https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/vdc_acl
resource "cloudavenue_vdc_acl" "vdc_acl" {

  count = length(var.vdc.acl_list) > 0 ? 1 : 0 # Ne crée la ressource que si acl_list n'est pas vide

  vdc = resource.cloudavenue_vdc.vdc.name
  shared_with = [
    for user_email in var.vdc.acl_list : {
      access_level = "ReadOnly"
      user_id      = data.cloudavenue_iam_user.acl_users[user_email].id # Obtenir l'ID utilisateur à partir du nom
    }
  ]
  depends_on = [cloudavenue_vdc.vdc]
}
