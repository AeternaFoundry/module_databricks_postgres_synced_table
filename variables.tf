variable "postgres_synced_tables" {
  description = <<EOT
Map of postgres_synced_tables, attributes below
Required:
    - synced_table_id
Optional:
    - provider_config
    - spec
EOT

  type = map(object({
    synced_table_id = string
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
    spec = optional(object({
      accelerated_sync                   = optional(bool)
      branch                             = optional(string)
      create_database_objects_if_missing = optional(bool)
      existing_pipeline_id               = optional(string)
      extra_columns = optional(list(object({
        column_name = string
        column_type = string
        compute     = optional(string)
        maintenance = optional(string)
      })))
      new_pipeline_spec = optional(object({
        budget_policy_id = optional(string)
        pipeline_channel = optional(string)
        storage_catalog  = optional(string)
        storage_schema   = optional(string)
      }))
      postgres_database      = optional(string)
      primary_key_columns    = optional(list(string))
      scheduling_policy      = optional(string)
      source_table_full_name = optional(string)
      timeseries_key         = optional(string)
      type_overrides = optional(list(object({
        column_name = string
        pg_type     = string
        size        = optional(number)
      })))
    }))
  }))
}

