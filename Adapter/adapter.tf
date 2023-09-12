resource "newrelic_nrql_alert_condition" "adapter" {
  account_id = var.account_id
  policy_id = newrelic_alert_policy.adapter.id
  type = "static"
  name = "Adapter Logs"
  enabled = true
  violation_time_limit_seconds = 2592000

  nrql {
    query = "SELECT count(*) FROM Log WHERE message like '%error%' and logtype like 'linux%'"
  }

  critical {
    operator = "above"
    threshold = 5
    threshold_duration = 18000
    threshold_occurrences = "at_least_once"
  }
  fill_option = "last_value"
  aggregation_window = 300
  aggregation_method = "event_flow"
  aggregation_delay = 0
}

