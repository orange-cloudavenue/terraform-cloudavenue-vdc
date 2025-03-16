variable "vdc" {
  type = object({
    billing_model         = optional(string, "PAYG")
    cpu_allocated         = optional(number, 22000)
    cpu_speed_in_mhz      = optional(number, 2200)
    description           = optional(string)
    disponibility_class   = optional(string, "ONE-ROOM")
    memory_allocated      = optional(number, 30)
    name                  = string
    service_class         = optional(string, "STD")
    storage_billing_model = optional(string, "PAYG")
    storage_profiles = list(object({
      class   = optional(string, "silver")
      default = optional(bool, true)
      limit   = optional(number, 500)
    }))
    acl_list = optional(list(string), [])
  })
  validation {
    condition = (
      alltrue([contains(["RESERVED", "PAYG", "DRAAS"], var.vdc.billing_model)]) &&
      alltrue([contains(["ONE-ROOM", "HA-DUAL-ROOM", "DUAL-ROOM"], var.vdc.disponibility_class)]) &&
      length(var.vdc.name) > 1 && length(var.vdc.name) < 28 &&
      alltrue([contains(["ECO", "STD", "HP", "VOIP"], var.vdc.service_class)]) &&
      alltrue([contains(["PAYG", "RESERVED"], var.vdc.storage_billing_model)])
    )
    error_message = "Invalid data for vdc object"
  }
}