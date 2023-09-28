resource "newrelic_alert_policy" "increased_error_rates" {
  name = "Increased Error Rates"
  incident_preference = "PER_CONDITION_AND_TARGET"
}