## TAGS ##

variable "defined_tags" {
  type    = map(string)
  default = {}
}

variable "freeform_tags" {
  type    = map(string)
  default = {}
}

## MODULES ##

variable "compartment" {
  type = any
}

variable "subnet" {
  type = any
}

## RESOURCES ##

variable "ekms_private_endpoint" {
  type = list(object({
    id                      = number
    ca_bundle               = string
    compartment_id          = any
    display_name            = string
    external_key_manager_ip = string
    subnet_id               = any
    port                    = optional(number)
    defined_tags            = optional(map(string))
    freeform_tags           = optional(map(string))
  }))
  default = []
}

variable "encrypted_data" {
  type = list(object({
    id                   = number
    crypto_endpoint      = string
    key_id               = any
    plaintext            = string
    associated_data      = optional(map(string))
    encryption_algorithm = optional(string)
    key_version_id       = optional(any)
    logging_context      = optional(map(string))
  }))
  default = []
}

variable "generated_key" {
  type = list(object({
    id                    = number
    crypto_endpoint       = string
    include_plaintext_key = bool
    key_id                = any
    associated_data       = optional(map(string))
    logging_context       = optional(map(string))
    key_shape = list(object({
      algorithm = string
      length    = string
    }))
  }))
  default = []
}

variable "key" {
  type = list(object({
    id                       = number
    compartment_id           = any
    display_name             = string
    management_endpoint      = string
    defined_tags             = optional(map(string))
    freeform_tags            = optional(map(string))
    is_auto_rotation_enabled = optional(bool)
    protection_mode          = optional(string)
    key_shape = list(object({
      algorithm = string
      length    = string
    }))
    auto_key_rotation_details = optional(list(object({
      last_rotation_message     = optional(string)
      last_rotation_status      = optional(string)
      rotation_interval_in_days = optional(number)
      time_of_last_rotation     = optional(string)
      time_of_next_rotation     = optional(string)
      time_of_schedule_start    = optional(string)
    })))
    external_key_reference = optional(list(object({
      external_key_id = any
    })))
  }))
  default = []
}

variable "key_version" {
  type = list(object({
    id                      = number
    key_id                  = any
    management_endpoint     = string
    external_key_version_id = optional(any)
  }))
  default = []
}

variable "sign" {
  type = list(object({
    id                = number
    crypto_endpoint   = string
    key_id            = any
    message           = string
    signing_algorithm = string
    key_version_id    = optional(any)
    message_type      = optional(string)
  }))
  default = []
}

variable "vault" {
  type = list(object({
    id               = number
    compartment_id   = any
    display_name     = string
    vault_type       = string
    defined_tags     = optional(map(string))
    freeform_tags    = optional(map(string))
    time_of_deletion = optional(string)
    external_key_manager_metadata = optional(list(object({
      external_vault_endpoint_url = string
      private_endpoint_id         = any
      oauth_metadata = list(object({
        client_app_id         = any
        client_app_secret     = string
        idcs_account_name_url = string
      }))
    })))
    restore_from_file = optional(list(object({
      content_length                  = string
      restore_vault_from_file_details = string
      content_md5                     = optional(string)
    })))
    restore_from_object_store = optional(list(object({
      destination = string
      bucket      = optional(string)
      namespace   = optional(string)
      object      = optional(string)
      uri         = optional(string)
    })))
  }))
  default = []
}

variable "vault_replication" {
  type = list(object({
    id             = number
    replica_region = string
    vault_id       = any
  }))
  default = []
}

variable "verify" {
  type = list(object({
    id                = number
    crypto_endpoint   = string
    key_id            = any
    key_version_id    = any
    message           = string
    signature         = string
    signing_algorithm = string
    message_type = optional(string)
  }))
  default = []
}
