variable "account_id" {
  description = "Account ID of the newrelic"
  //default = "3174604"
  default = "4113301"
}
variable "api_key" {
  description = "Api key of the newrelic."
}

variable "region" {
  description = "Region of the newrelic."
  default = "US"
}

variable "devops_tickets_ingest_destination_id" {
  default = "89516e89-d473-45f3-9b67-7727e4304c89"
}