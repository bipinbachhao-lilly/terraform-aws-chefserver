variable "name" {
  type        = string
  description = "Name of the instance to be created."
}

variable "aws_instance_type" {
  type        = string
  description = "Name of the AWS instance type used to determine size of instances."
  default     = "t3.medium"
}

variable "platform" {
  type        = string
  description = "Operating System of the instance to be created."
}

variable "target_group_arn" {
  type        = string
  description = ""
}

variable "key_name" {
  type        = string
  description = "SSH key for DCV instances"
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
