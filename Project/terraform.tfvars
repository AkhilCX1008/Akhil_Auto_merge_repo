rg_name = {
  rg1 = {
    rg_name  = "akhilrg"
    location = "korea central"

  }
  rg3 = {
    rg_name  = "akhilrg3"
    location = "korea central"

  }
}

vnets = {
  vnet1 = {
    name          = "akhilvnet"
    rg_name       = "akhilrg"
    location      = "korea central"
    address_space = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "akhilsubnet1"
    virtual_network_name = "akhilvnet"
    rg_name              = "akhilrg"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "akhilsubnet2"
    virtual_network_name = "akhilvnet"
    rg_name              = "akhilrg"
    address_prefixes     = ["10.0.2.0/24"]
  }
}


nic_ids = {
  nic1 = {
    name                 = "akhilnic"
    location             = "korea central"
    virtual_network_name = "akhilvnet"
    rg_name              = "akhilrg"

    ip_configuration = {
      name                          = "internal"
      subnet_name                   = "akhilsubnet1"
      private_ip_address_allocation = "Dynamic"

    }
  }
}


vms = {
  vm1 = {
    name                 = "akhilvm"
    rg_name              = "akhilrg"
    location             = "korea central"
    subnet_name          = "akhilsubnet1"
    virtual_network_name = "akhilvnet"
    nic_name             = "akhilnic"
    vm_size              = "Standard_DS1_v2"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    storage_os_disk = {
      name              = "myosdisk1"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }
    os_profile = {
      computer_name  = "akhilcomputer"
      admin_username = "akhil"
      admin_password = "Akhilesh@123"
    }
    os_profile_linux_config = {
      disable_password_authentication = "false"
    }
  }
}




pips = {
  pip1 = {
    name              = "akhilpip"
    location          = "korea central"
    rg_name           = "akhilrg"
    allocation_method = "Dynamic"
  }
}