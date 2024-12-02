terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "b27ff864-5fa7-4131-a0ae-a06397e67755"
 features {}
}