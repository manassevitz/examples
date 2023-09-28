resource "newrelic_nrql_alert_condition" "new_relic_ses_bounce_alert" {
  account_id = var.account_id
  policy_id = newrelic_alert_policy.ses_alert_policy.id
  type = "static"
  name = "New Relic SES Bounce alert"
  enabled = true
  violation_time_limit_seconds = 259200

  nrql {
    query = "SELECT sum(`provider.Bounce.Sum`) FROM SesRegionSample WHERE provider='SesRegion' AND `entityGuid` = 'MzE3NDYwNHxJTkZSQXxOQXw0NzA3MTY3NTYyNzE0MDExMTY5'"
  }

  critical {
    operator = "above_or_equals"
    threshold = 0.1
    threshold_duration = 60
    threshold_occurrences = "all"
  }

  warning {
    operator = "above"
    threshold = 0
    threshold_duration = 60
    threshold_occurrences = "all"
  }
  fill_option = "none"
  aggregation_window = 60
  aggregation_method = "event_flow"
  aggregation_delay = 120
  slide_by = 30
  expiration_duration = 600
  open_violation_on_expiration = false
  close_violations_on_expiration = true
}