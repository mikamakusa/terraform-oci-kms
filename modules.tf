module "identity" {
  source      = "modules/terraform-oci-identity"
  compartment = var.compartment
}

module "core" {
  source      = "modules/terraform-oci-core"
  compartment = var.compartment
  subnet      = var.subnet
}