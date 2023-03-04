variable "subscription_id" {
  type        = string
  description = "Subscription ID where the role wll be scoped"
}

variable "DCODNext_customrole_name" {
  type        = string
  description = "Name of the Custome Role"
}

variable "DCODNext_group_Name" {
  type        = string
  description = "Name of the Group identities who have the access rights for Lock resource"
}