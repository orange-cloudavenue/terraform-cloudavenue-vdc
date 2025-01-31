variable "vdc" {
  type = object({
    billing_model         = string
    cpu_allocated         = number
    cpu_speed_in_mhz      = number
    description           = string
    disponibility_class   = string
    memory_allocated      = number
    name                  = string
    service_class         = string
    storage_billing_model = string
    storage_profiles = list(object({
      class   = string,
      default = bool,
      limit   = number,
    }))
    acl_list = list(string)
  })
  default = {
    billing_model         = "PAYG"
    cpu_allocated         = 22000
    cpu_speed_in_mhz      = 2200
    description           = null
    disponibility_class   = "ONE-ROOM"
    memory_allocated      = 30
    name                  = null
    service_class         = "STD"
    storage_billing_model = "PAYG"
    storage_profiles = [
      {
        class   = "silver"
        default = true
        limit   = 500
      },
    ]
    acl_list = null
  }
  validation {
    condition = (
      alltrue([contains(["RESERVED", "PAYG", "DRAAS"], var.vdc.billing_model)]) &&
      alltrue([contains(["ONE-ROOM", "HA-DUAL-ROOM", "DUAL-ROOM"], var.vdc.disponibility_class)]) &&
      length(var.vdc.name) > 1 && length(var.vdc.name) < 28 &&
      alltrue([contains(["ECO", "STD", "HP", "VOIP"], var.vdc.service_class)]) &&
      alltrue([contains(["PAYG", "RESERVED"], var.vdc.storage_billing_model)])
    )
    error_message = "Variables not compliant."
  }
}