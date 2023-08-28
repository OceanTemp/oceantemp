resource "azurerm_cosmosdb_account" "oceantempdbaccount" {
  name                = "oceantempdbaccount"
  resource_group_name = azurerm_resource_group.oceantemprg.name
  location            = azurerm_resource_group.oceantemprg.location
  offer_type          = "Standard"

  capabilities {
    name = "EnableCassandra"
  }

  consistency_policy {
    consistency_level = "Strong"
  }

  geo_location {
    location          = azurerm_resource_group.oceantemprg.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_cassandra_keyspace" "oceantempdbkeyspace" {
  name                = "oceantempdbkeyspace"
  resource_group_name = azurerm_cosmosdb_account.oceantemprg.resource_group_name
  account_name        = azurerm_cosmosdb_account.oceantemprg.name
  throughput          = 400
}

resource "azurerm_cosmosdb_cassandra_table" "oceantempdbtable" {
  name                  = "oceantempdbtable"
  cassandra_keyspace_id = azurerm_cosmosdb_cassandra_keyspace.oceantempdbkeyspace.id

  schema {
    column {
      name = "test1"
      type = "ascii"
    }

    column {
      name = "test2"
      type = "int"
    }

    partition_key {
      name = "test1"
    }
  }
}