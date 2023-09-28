resource "newrelic_notification_destination" "TCP__MAIL_GEWENI" {
  account_id = var.account_id
  name = "email-geweni-1"
  type = "EMAIL"

  property {
    key = "email"
    value = "Geweni@tcpsoftware.com"
  }
}

resource "newrelic_notification_channel" "TCP__MAIL_GEWENI" {
  account_id = var.account_id
  name = "email-geweni"
  type = "EMAIL"
  destination_id = newrelic_notification_destination.TCP__MAIL_GEWENI.id
  product = "IINT"

  property {
    key = "subject"
    value = "New Alert"
  }

  property {
    key = "customDetailsEmail"
    value = "issue id - {{issueId}}"
  }
}