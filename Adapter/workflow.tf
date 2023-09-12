resource "newrelic_workflow" "workflow" {
  name                  = "Adapter Log"
  muting_rules_handling = "DONT_NOTIFY_FULLY_MUTED_ISSUES"

  issues_filter {
    name = "FILTER_Data"
    type = "FILTER"

    predicate {
      attribute = "labels.policyIds"
      operator  = "EXACTLY_MATCHES"
      values    = [newrelic_alert_policy.adapter.id]
    }
  }

  destination {
    channel_id = newrelic_notification_channel.TCP__MAIL_GEWENI.id
    notification_triggers = [
      "ACTIVATED",
      "ACKNOWLEDGED",
      "PRIORITY_CHANGED",
      "CLOSED",
      "OTHER_UPDATES"
    ]
  }
}