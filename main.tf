resource "databricks_postgres_synced_table" "postgres_synced_tables" {
  for_each = var.postgres_synced_tables

  synced_table_id = each.value.synced_table_id
  provider_config = each.value.provider_config
  spec            = each.value.spec
}

