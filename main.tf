resource "oci_kms_ekms_private_endpoint" "this" {
  count                   = length(var.compartment) == 0 ? 0 : length(var.ekms_private_endpoint)
  ca_bundle               = lookup(var.ekms_private_endpoint[count.index], "ca_bundle")
  compartment_id          = try(element(module.identity.*.compartment_id, lookup(var.ekms_private_endpoint[count.index], "compartment_id")))
  display_name            = lookup(var.ekms_private_endpoint[count.index], "display_name")
  external_key_manager_ip = lookup(var.ekms_private_endpoint[count.index], "external_key_manager_ip")
  subnet_id               = try(element(module.core, lookup(var.ekms_private_endpoint[count.index], "subnet_id")))
  port                    = lookup(var.ekms_private_endpoint[count.index], "port")
  defined_tags            = merge(var.defined_tags, lookup(var.ekms_private_endpoint[count.index], "defined_tags"))
  freeform_tags           = merge(var.freeform_tags, lookup(var.ekms_private_endpoint[count.index], "freeform_tags"))
}

resource "oci_kms_encrypted_data" "this" {
  count                = length(var.key) == 0 ? 0 : length(var.encrypted_data)
  crypto_endpoint      = lookup(var.encrypted_data[count.index], "crypto_endpoint")
  key_id               = try(element(oci_kms_key.this.*.id, lookup(var.encrypted_data[count.index], "key_id")))
  plaintext            = lookup(var.encrypted_data[count.index], "plaintext")
  associated_data      = lookup(var.encrypted_data[count.index], "associated_data")
  encryption_algorithm = lookup(var.encrypted_data[count.index], "encryption_algorithm")
  key_version_id       = try(element(oci_kms_key_version.this.*.id, lookup(var.encrypted_data[count.index], "key_version_id")))
  logging_context      = lookup(var.encrypted_data[count.index], "logging_context")
}

resource "oci_kms_generated_key" "this" {
  count                 = length(var.key) == 0 ? 0 : length(var.generated_key)
  crypto_endpoint       = lookup(var.generated_key[count.index], "crypto_endpoint")
  include_plaintext_key = lookup(var.generated_key[count.index], "include_plaintext_key")
  key_id                = try(element(oci_kms_key.this.*.id, lookup(var.generated_key[count.index], "key_id")))
  associated_data       = lookup(var.generated_key[count.index], "associated_data")
  logging_context       = lookup(var.generated_key[count.index], "logging_context")

  dynamic "key_shape" {
    for_each = lookup(var.generated_key[count.index], "key_shape")
    content {
      algorithm = lookup(key_shape.value, "algorithm")
      length    = lookup(key_shape.value, "length")
    }
  }
}

resource "oci_kms_key" "this" {
  count                    = length(var.compartment) == 0 ? 0 : length(var.key)
  compartment_id           = try(element(module.identity.*.compartment_id, lookup(var.key[count.index], "compartment_id")))
  display_name             = lookup(var.key[count.index], "display_name")
  management_endpoint      = lookup(var.key[count.index], "management_endpoint")
  defined_tags             = merge(var.defined_tags, lookup(var.key[count.index], "defined_tags"))
  freeform_tags            = merge(var.freeform_tags, lookup(var.key[count.index], "freeform_tags"))
  is_auto_rotation_enabled = lookup(var.key[count.index], "is_auto_rotation_enabled")
  protection_mode          = lookup(var.key[count.index], "protection_mode")

  dynamic "key_shape" {
    for_each = lookup(var.key[count.index], "key_shape")
    content {
      algorithm = lookup(key_shape.value, "algorithm")
      length    = lookup(key_shape.value, "length")
    }
  }

  dynamic "auto_key_rotation_details" {
    for_each = try(lookup(var.key[count.index], "auto_key_rotation_details") == null ? [] : ["auto_key_rotation_details"])
    iterator = auto
    content {
      last_rotation_message     = lookup(auto.value, "last_rotation_message")
      last_rotation_status      = lookup(auto.value, "last_rotation_status")
      rotation_interval_in_days = lookup(auto.value, "rotation_interval_in_days")
      time_of_last_rotation     = lookup(auto.value, "time_of_last_rotation")
      time_of_next_rotation     = lookup(auto.value, "time_of_next_rotation")
      time_of_schedule_start    = lookup(auto.value, "time_of_schedule_start")
    }
  }

  dynamic "external_key_reference" {
    for_each = try(lookup(var.key[count.index], "external_key_reference") == null ? [] : ["external_key_reference"])
    iterator = external
    content {
      external_key_id = try(element(oci_kms_key.this.*.id, lookup(external.value, "external_key_id")))
    }
  }
}

resource "oci_kms_key_version" "this" {
  count                   = length(var.key) == 0 ? 0 : length(var.key_version)
  key_id                  = try(element(oci_kms_key.this.*.id, lookup(var.key_version[count.index], "key_id")))
  management_endpoint     = lookup(var.key_version[count.index], "management_endpoint")
  external_key_version_id = try(element(oci_kms_key_version.this.*.id, lookup(var.key_version[count.index], "external_key_version_id")))
}

resource "oci_kms_sign" "this" {
  count             = length(var.key) == 0 ? 0 : length(var.sign)
  crypto_endpoint   = lookup(var.sign[count.index], "crypto_endpoint")
  key_id            = try(element(oci_kms_key.this.*.id, lookup(var.sign[count.index], "key_id")))
  message           = lookup(var.sign[count.index], "message")
  signing_algorithm = lookup(var.sign[count.index], "signing_algorithm")
  key_version_id    = try(element(oci_kms_key_version.this.*.id, lookup(var.sign[count.index], "key_version_id")))
  message_type      = lookup(var.sign[count.index], "message_type")
}

resource "oci_kms_vault" "this" {
  count            = length(var.compartment) == 0 ? 0 : length(var.vault)
  compartment_id   = try(element(module.identity.*.compartment_id, lookup(var.vault[count.index], "compartment_id")))
  display_name     = lookup(var.vault[count.index], "display_name")
  vault_type       = lookup(var.vault[count.index], "vault_type")
  defined_tags     = merge(var.defined_tags, lookup(var.vault[count.index], "defined_tags"))
  freeform_tags    = merge(var.freeform_tags, lookup(var.vault[count.index], "freeform_tags"))
  time_of_deletion = lookup(var.vault[count.index], "time_of_deletion")

  dynamic "external_key_manager_metadata" {
    for_each = try(lookup(var.vault[count.index], "external_key_manager_metadata") == null ? [] : ["external_key_manager_metadata"])
    iterator = external
    content {
      external_vault_endpoint_url = lookup(external.value, "external_vault_endpoint_url")
      private_endpoint_id         = lookup(external.value, "private_endpoint_id")

      dynamic "oauth_metadata" {
        for_each = lookup(external.value, "oauth_metadata")
        content {
          client_app_id         = lookup(oauth_metadata.value, "client_app_id")
          client_app_secret     = lookup(oauth_metadata.value, "client_app_secret")
          idcs_account_name_url = lookup(oauth_metadata.value, "idcs_account_name_url")
        }
      }
    }
  }

  dynamic "restore_from_file" {
    for_each = try(lookup(var.vault[count.index], "restore_from_file") == null ? [] : ["restore_from_file"])
    iterator = file
    content {
      content_length                  = lookup(file.value, "content_length")
      restore_vault_from_file_details = lookup(file.value, "restore_vault_from_file_details")
      content_md5                     = lookup(file.value, "content_md5")
    }
  }

  dynamic "restore_from_object_store" {
    for_each = try(lookup(var.vault[count.index], "restore_from_object_store") == null ? [] : ["restore_from_object_store"])
    iterator = store
    content {
      destination = lookup(store.value, "destination")
      bucket      = lookup(store.value, "bucket")
      namespace   = lookup(store.value, "namespace")
      object      = lookup(store.value, "object")
      uri         = lookup(store.value, "uri")
    }
  }
}

resource "oci_kms_vault_replication" "this" {
  count          = length(var.vault) == 0 ? 0 : length(var.vault_replication)
  replica_region = lookup(var.vault_replication[count.index], "replica_region")
  vault_id       = try(element(oci_kms_vault.this.*.id, lookup(var.vault_replication[count.index], "vault_id")))
}

resource "oci_kms_verify" "this" {
  count             = (length(var.key) && length(var.key_version)) == 0 ? 0 : length(var.verify)
  crypto_endpoint   = lookup(var.verify[count.index], "crypto_endpoint")
  key_id            = try(element(oci_kms_key.this.*.id, lookup(var.verify[count.index], "key_id")))
  key_version_id    = try(element(oci_kms_key_version.this.*.id, lookup(var.verify[count.index], "key_version_id")))
  message           = lookup(var.verify[count.index], "message")
  signature         = lookup(var.verify[count.index], "signature")
  signing_algorithm = lookup(var.verify[count.index], "signing_algorithm")
  message_type      = lookup(var.verify[count.index], "message_type")
}