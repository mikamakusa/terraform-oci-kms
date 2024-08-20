## EKMS PRIVATE ENDPOINT

output "ekms_private_endpoint_id" {
  value = try(
    oci_kms_ekms_private_endpoint.this.*.id
  )
}

output "ekms_private_endpoint_private_endpoint_ip" {
  value = try(
    oci_kms_ekms_private_endpoint.this.*.private_endpoint_ip
  )
}

## ENCRYPTED DATA

output "encrypted_data_id" {
  value = try(
    oci_kms_encrypted_data.this.*.id
  )
}

output "encrypted_data_key_id" {
  value = try(
    oci_kms_encrypted_data.this.*.key_id
  )
}

output "encrypted_data_key_version_id" {
  value = try(
    oci_kms_encrypted_data.this.*.key_version_id
  )
}

## GENERATED KEY

output "generated_key_id" {
  value = try(
    oci_kms_generated_key.this.*.id
  )
}

output "generated_key_ciphertext" {
  value = try(
    oci_kms_generated_key.this.*.ciphertext
  )
}

output "generated_key_associated_data" {
  value = try(
    oci_kms_generated_key.this.*.associated_data
  )
}

## KEY

output "key_id" {
  value = try(
    oci_kms_key.this.*.id
  )
}

output "key_state" {
  value = try(
    oci_kms_key.this.*.state
  )
}

output "key_current_version" {
  value = try(
    oci_kms_key.this.*.current_key_version
  )
}

output "key_shape" {
  value = try(
    oci_kms_key.this.*.key_shape
  )
}

## KEY VERSION

output "key_version_id" {
  value = try(
    oci_kms_key_version.this.*.id
  )
}

output "key_version_state" {
  value = try(
    oci_kms_key_version.this.*.state
  )
}

output "key_version_key_id" {
  value = try(
    oci_kms_key_version.this.*.key_id
  )
}

## SIGN

output "sign_id" {
  value = try(
    oci_kms_sign.this.*.id
  )
}

output "sign_key_id" {
  value = try(
    oci_kms_sign.this.*.key_id
  )
}

output "sign_key_version_id" {
  value = try(
    oci_kms_sign.this.*.key_version_id
  )
}

## VAULT

output "vault_id" {
  value = try(
    oci_kms_vault.this.*.id
  )
}

output "vault_state" {
  value = try(
    oci_kms_vault.this.*.state
  )
}

## VAULT REPLICATION

output "vault_replication_id" {
  value = try(
    oci_kms_vault_replication.this.*.id
  )
}

output "vault_replication_vault_id" {
  value = try(
    oci_kms_vault_replication.this.*.vault_id
  )
}

## VERIFY

output "verify_id" {
  value = try(
    oci_kms_verify.this.*.id
  )
}

output "verify_key_id" {
  value = try(
    oci_kms_verify.this.*.key_id
  )
}

output "verify_key_version_id" {
  value = try(
    oci_kms_verify.this.*.key_version_id
  )
}

output "verify_signature_si_valid" {
  value = try(
    oci_kms_verify.this.*.is_signature_valid
  )
}

output "verify_signing_algorithm" {
  value = try(
    oci_kms_verify.this.*.signing_algorithm
  )
}