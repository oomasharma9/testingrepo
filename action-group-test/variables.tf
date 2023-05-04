variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

variable "location_code" {
  description = "Location code identifier"
  type        = string
  default     = "weu"
}

variable "single_email" {
  type = map(object({
    name          = string
    email_address = string
  }))
  default = {
    mail1 = {
      name          = "single",
      email_address = "uma.c.sharma@avanade.com"
    }
  }
}

variable "multiple_emails" {
  type = map(object({
    name          = string
    email_address = string
  }))
  default = {
    mail1 = {
      name          = "test1",
      email_address = "uma.c.sharma@avanade.com"
    }
    mail2 = {
      name          = "test2",
      email_address = "oomasharma9@gmail.com"
    }
  }
}

variable "role-id-owner" {
  type    = string
  default = "8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
}



/*
variable "vm_type" {
  type        = string
  description = "windows or linux"
}
variable "vm_name" {
  type        = string
  description = "Name of the vm"
}

variable "resource_group_name" {
  type        = string
  description = "(required) The name of the Resource Group where the VM"
}

variable "action_group_present" {
  description = "Flag to check if action group is present or not"
  type        = bool
}

variable "infra_resource_group_name" {
  type        = string
  description = "(required) The name of the Resource Group where the subnets are hosted"
}*/

/*variable "new_deployment" {
  description = "new deployment tick"
  type        = string
  default     = "empty"
}





variable "vnet_name" {
  type        = string
  description = "The name of the VNet where to create the VM"
}

variable "subnet_name" {
  type        = string
  description = " (required) The name of the virtual network subnet to create the VM"
}


variable "computer_name" {
  type        = string
  description = "Specifies the Hostname which should be used for this Virtual Machine"
  default     = null

}

variable "nic_enable_accelerated_networking" {
  description = "Boolean to enable Accelerated Networking"
  type        = bool
  default     = false
}


variable "vm_user" {
  type        = string
  description = "Virtual machine user name"
}

variable "vm_public_key" {
  default     = null
  type        = string
  description = "Virtual machine public key for authentication (2048-bit ssh-rsa)"
}


variable "vm_size" {
  default     = "Standard_D4s_v4"
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2"
}


# source_image_reference 
variable "vm_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines."
}

variable "vm_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines"
}

variable "vm_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines. "
}

variable "vm_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines."
}


# OS Disk
variable "vm_disk_caching" {
  default     = "ReadWrite"
  type        = string
  description = "The type of Caching which should be used for this Data Disk. Possible values are None, ReadOnly and ReadWrite."
}


variable "vm_os_disk_disk_size_gb" {
  default     = 100
  type        = number
  description = "The size of the Data Disk which should be created"
}

variable "vm_data_disk_disk_size_gb1" {
  default     = 8000
  type        = number
  description = "The size of the Data Disk which should be created for the second data disk"
}

#Data disk
variable "add_data_disk" {
  default     = false
  type        = bool
  description = "Boolean to add data disk "
}

variable "add_data_disk1" {
  default     = false
  type        = bool
  description = "This is to add a second data disk "
}

variable "vm_data_disk_size_gb" {
  default     = null
  type        = number
  description = "The size of the Data Disk which should be created"
}

variable "vm_data_disk_size_gb1" {
  default     = 8000
  type        = number
  description = "The size of the Data Disk which should be created for the second data disk"
}

variable "os_disk_storage_account_type" {
  default     = "StandardSSD_LRS"
  type        = string
  description = "The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS."
}


variable "vm_data_disk_lun" {
  default     = "0"
  type        = string
  description = "The Logical Unit Number of the Data Disk, which needs to be unique within the Virtual Machine. Changing this forces a new resource to be created."
}


variable "vm_data_disk_lun1" {
  default     = "1"
  type        = string
  description = "This is to add a second data disk"
}


variable "data_disk_storage_account_type" {
  default     = "StandardSSD_LRS"
  type        = string
  description = "The Type of Storage Account which should back this Data Disk. Possible values include Standard_LRS, StandardSSD_LRS, Premium_LRS and UltraSSD_LRS."
}


variable "data_disk_storage_account_type1" {
  default     = "StandardSSD_LRS"
  type        = string
  description = "This is to add a second data disk"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "Map of tags for resource"
}


variable "vm_plan" {
  description = "Virtual Machine plan image information. _virtual_machine."
  type = object({
    name      = string
    product   = string
    publisher = string
  })
  default = null
}


variable "log_analytics_workspace_id" {
  default     = null
  type        = string
  description = "log analytics workspace id to be used for the extension installation"
}

variable "log_analytics_workspace_key" {
  default     = null
  type        = string
  description = "log analytics workspace key to be used for the extension installation"
}


variable "storage_account_name" {
  default     = null
  type        = string
  description = "Storage account where packages are stored"
}


variable "log_analytics_workspace_name" {
  default     = null
  type        = string
  description = "log shared workspace name"
}

variable "log_analytics_resource_group_name" {
  default     = null
  type        = string
  description = "log shared resource group name"
}

variable "action_group_name" {
  description = "Name of the Action group where alert needs to be attached"
  type        = string
}


variable "zone" {
  description = "(Optional) Specifies the Availability Zones in which this Linux Virtual Machine should be located. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}*/