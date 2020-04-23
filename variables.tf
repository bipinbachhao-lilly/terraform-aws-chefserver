variable "instance_name" {
  type        = string
  description = "Name of the instance to be created."
}

variable "instance_type" {
  type        = string
  description = "Name of the AWS instance type used to determine size of instances."
  default     = "t3.medium"
}

variable "platform" {
  type        = string
  description = "Operating System of the instance to be created."
}

variable "key_name" {
  type        = string
  description = "SSH key for Chef-Server Instance"
}

variable "key_path" {
  type  = string
  description = "SSH Key Path to login"
}

variable  "root_volume_size"  {
  type = number
  description = "Size of root volume"
  default = 50
}

variable "hcs_mandatory_tags" {
  description = "HCS mandatory tags"
  type        = map(string)
  default = {
    Level1BusinessArea = "HPC"
    SystemOwner        = "2019830"
    CostCenter         = "100A340"
    DataClassification = "Green"
    PrimaryItContact   = "2181571"
    SystemCustodian    = "131988"
    CostCenterApprover = "Jonathan Klinginsmith"
    Hipaa              = "No"
    SnowRequestId      = "NA"
    ApplicationCi      = "GSHPC"
    OsType             = "Redhat"
    UptimeHours        = "NA"
    Inspector          = "NA"
  }
}
