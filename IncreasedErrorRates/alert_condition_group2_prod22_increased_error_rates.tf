resource "newrelic_nrql_alert_condition" "prod22_increased_error_rates" {
  account_id = var.account_id
  policy_id = newrelic_alert_policy.increased_error_rates.id
  type = "baseline"
  name = "Prod22 Increased Error Rates"
  enabled = true
  violation_time_limit_seconds = 259200

  nrql {
    query = "SELECT count(apm.service.error.count) / count(apm.service.transaction.duration) as 'Web errors' FROM Metric WHERE appName LIKE '%Prod22%' AND (transactionType = 'Web')"
  }

  critical {
    operator = "above"
    threshold = 10
    threshold_duration = 300
    threshold_occurrences = "all"
  }
  fill_option = "none"
  aggregation_window = 60
  aggregation_method = "event_flow"
  aggregation_delay = 120
  baseline_direction = "upper_and_lower"
}