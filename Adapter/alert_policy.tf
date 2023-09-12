resource "newrelic_alert_policy" "adapter" {
  name = "Adapter Logs"
  incident_preference = "PER_CONDITION_AND_TARGET"
}