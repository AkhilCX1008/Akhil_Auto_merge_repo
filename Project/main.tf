terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
}
provider "azurerm" {
  features {}
}


module "resource_group" {
  for_each = var.rg_name
  source   = "./modules/azurerm_resource_group"
  rg_name  = each.value.rg_name
  location = each.value.location
}

module "vnet" {
  source     = "./modules/azurerm_vnet"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}
module "subnets" {
  source     = "./modules/azurerm_subnets"
  subnets    = var.subnets
  depends_on = [module.vnet]
}

module "nic" {
  source     = "./modules/azurerm_nic"
  nic_ids    = var.nic_ids
  depends_on = [module.vnet, module.subnets, module.public_ip]
}

module "public_ip" {
  source     = "./modules/azurerm_public_ip"
  pips       = var.pips
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "./modules/azurerm_virtual_machine"
  vms        = var.vms
  depends_on = [module.resource_group, module.nic]
}

