## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | 6.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 6.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_core"></a> [core](#module\_core) | modules/terraform-oci-core | n/a |
| <a name="module_identity"></a> [identity](#module\_identity) | modules/terraform-oci-identity | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_kms_ekms_private_endpoint.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_ekms_private_endpoint) | resource |
| [oci_kms_encrypted_data.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_encrypted_data) | resource |
| [oci_kms_generated_key.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_generated_key) | resource |
| [oci_kms_key.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_key) | resource |
| [oci_kms_key_version.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_key_version) | resource |
| [oci_kms_sign.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_sign) | resource |
| [oci_kms_vault.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_vault) | resource |
| [oci_kms_vault_replication.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_vault_replication) | resource |
| [oci_kms_verify.this](https://registry.terraform.io/providers/oracle/oci/6.7.0/docs/resources/kms_verify) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment"></a> [compartment](#input\_compartment) | n/a | `any` | n/a | yes |
| <a name="input_defined_tags"></a> [defined\_tags](#input\_defined\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_ekms_private_endpoint"></a> [ekms\_private\_endpoint](#input\_ekms\_private\_endpoint) | n/a | <pre>list(object({<br>    id                      = number<br>    ca_bundle               = string<br>    compartment_id          = any<br>    display_name            = string<br>    external_key_manager_ip = string<br>    subnet_id               = any<br>    port                    = optional(number)<br>    defined_tags            = optional(map(string))<br>    freeform_tags           = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_encrypted_data"></a> [encrypted\_data](#input\_encrypted\_data) | n/a | <pre>list(object({<br>    id                   = number<br>    crypto_endpoint      = string<br>    key_id               = any<br>    plaintext            = string<br>    associated_data      = optional(map(string))<br>    encryption_algorithm = optional(string)<br>    key_version_id       = optional(any)<br>    logging_context      = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_freeform_tags"></a> [freeform\_tags](#input\_freeform\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_generated_key"></a> [generated\_key](#input\_generated\_key) | n/a | <pre>list(object({<br>    id                    = number<br>    crypto_endpoint       = string<br>    include_plaintext_key = bool<br>    key_id                = any<br>    associated_data       = optional(map(string))<br>    logging_context       = optional(map(string))<br>    key_shape = list(object({<br>      algorithm = string<br>      length    = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_key"></a> [key](#input\_key) | n/a | <pre>list(object({<br>    id                       = number<br>    compartment_id           = any<br>    display_name             = string<br>    management_endpoint      = string<br>    defined_tags             = optional(map(string))<br>    freeform_tags            = optional(map(string))<br>    is_auto_rotation_enabled = optional(bool)<br>    protection_mode          = optional(string)<br>    key_shape = list(object({<br>      algorithm = string<br>      length    = string<br>    }))<br>    auto_key_rotation_details = optional(list(object({<br>      last_rotation_message     = optional(string)<br>      last_rotation_status      = optional(string)<br>      rotation_interval_in_days = optional(number)<br>      time_of_last_rotation     = optional(string)<br>      time_of_next_rotation     = optional(string)<br>      time_of_schedule_start    = optional(string)<br>    })))<br>    external_key_reference = optional(list(object({<br>      external_key_id = any<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_key_version"></a> [key\_version](#input\_key\_version) | n/a | <pre>list(object({<br>    id                      = number<br>    key_id                  = any<br>    management_endpoint     = string<br>    external_key_version_id = optional(any)<br>  }))</pre> | `[]` | no |
| <a name="input_sign"></a> [sign](#input\_sign) | n/a | <pre>list(object({<br>    id                = number<br>    crypto_endpoint   = string<br>    key_id            = any<br>    message           = string<br>    signing_algorithm = string<br>    key_version_id    = optional(any)<br>    message_type      = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `any` | n/a | yes |
| <a name="input_vault"></a> [vault](#input\_vault) | n/a | <pre>list(object({<br>    id               = number<br>    compartment_id   = any<br>    display_name     = string<br>    vault_type       = string<br>    defined_tags     = optional(map(string))<br>    freeform_tags    = optional(map(string))<br>    time_of_deletion = optional(string)<br>    external_key_manager_metadata = optional(list(object({<br>      external_vault_endpoint_url = string<br>      private_endpoint_id         = any<br>      oauth_metadata = list(object({<br>        client_app_id         = any<br>        client_app_secret     = string<br>        idcs_account_name_url = string<br>      }))<br>    })))<br>    restore_from_file = optional(list(object({<br>      content_length                  = string<br>      restore_vault_from_file_details = string<br>      content_md5                     = optional(string)<br>    })))<br>    restore_from_object_store = optional(list(object({<br>      destination = string<br>      bucket      = optional(string)<br>      namespace   = optional(string)<br>      object      = optional(string)<br>      uri         = optional(string)<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_vault_replication"></a> [vault\_replication](#input\_vault\_replication) | n/a | <pre>list(object({<br>    id             = number<br>    replica_region = string<br>    vault_id       = any<br>  }))</pre> | `[]` | no |
| <a name="input_verify"></a> [verify](#input\_verify) | n/a | <pre>list(object({<br>    id                = number<br>    crypto_endpoint   = string<br>    key_id            = any<br>    key_version_id    = any<br>    message           = string<br>    signature         = string<br>    signing_algorithm = string<br>    message_type = optional(string)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ekms_private_endpoint_id"></a> [ekms\_private\_endpoint\_id](#output\_ekms\_private\_endpoint\_id) | n/a |
| <a name="output_ekms_private_endpoint_private_endpoint_ip"></a> [ekms\_private\_endpoint\_private\_endpoint\_ip](#output\_ekms\_private\_endpoint\_private\_endpoint\_ip) | n/a |
| <a name="output_encrypted_data_id"></a> [encrypted\_data\_id](#output\_encrypted\_data\_id) | n/a |
| <a name="output_encrypted_data_key_id"></a> [encrypted\_data\_key\_id](#output\_encrypted\_data\_key\_id) | n/a |
| <a name="output_encrypted_data_key_version_id"></a> [encrypted\_data\_key\_version\_id](#output\_encrypted\_data\_key\_version\_id) | n/a |
| <a name="output_generated_key_associated_data"></a> [generated\_key\_associated\_data](#output\_generated\_key\_associated\_data) | n/a |
| <a name="output_generated_key_ciphertext"></a> [generated\_key\_ciphertext](#output\_generated\_key\_ciphertext) | n/a |
| <a name="output_generated_key_id"></a> [generated\_key\_id](#output\_generated\_key\_id) | n/a |
| <a name="output_key_current_version"></a> [key\_current\_version](#output\_key\_current\_version) | n/a |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | n/a |
| <a name="output_key_shape"></a> [key\_shape](#output\_key\_shape) | n/a |
| <a name="output_key_state"></a> [key\_state](#output\_key\_state) | n/a |
| <a name="output_key_version_id"></a> [key\_version\_id](#output\_key\_version\_id) | n/a |
| <a name="output_key_version_key_id"></a> [key\_version\_key\_id](#output\_key\_version\_key\_id) | n/a |
| <a name="output_key_version_state"></a> [key\_version\_state](#output\_key\_version\_state) | n/a |
| <a name="output_sign_id"></a> [sign\_id](#output\_sign\_id) | n/a |
| <a name="output_sign_key_id"></a> [sign\_key\_id](#output\_sign\_key\_id) | n/a |
| <a name="output_sign_key_version_id"></a> [sign\_key\_version\_id](#output\_sign\_key\_version\_id) | n/a |
| <a name="output_vault_id"></a> [vault\_id](#output\_vault\_id) | n/a |
| <a name="output_vault_replication_id"></a> [vault\_replication\_id](#output\_vault\_replication\_id) | n/a |
| <a name="output_vault_replication_vault_id"></a> [vault\_replication\_vault\_id](#output\_vault\_replication\_vault\_id) | n/a |
| <a name="output_vault_state"></a> [vault\_state](#output\_vault\_state) | n/a |
| <a name="output_verify_id"></a> [verify\_id](#output\_verify\_id) | n/a |
| <a name="output_verify_key_id"></a> [verify\_key\_id](#output\_verify\_key\_id) | n/a |
| <a name="output_verify_key_version_id"></a> [verify\_key\_version\_id](#output\_verify\_key\_version\_id) | n/a |
| <a name="output_verify_signature_si_valid"></a> [verify\_signature\_si\_valid](#output\_verify\_signature\_si\_valid) | n/a |
| <a name="output_verify_signing_algorithm"></a> [verify\_signing\_algorithm](#output\_verify\_signing\_algorithm) | n/a |
