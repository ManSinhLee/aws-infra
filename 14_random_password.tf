resource "random_password" "database_master_password" {
  length           = 24
  special          = true
  override_special = "!#$%^*()-=+_?{}|"
}