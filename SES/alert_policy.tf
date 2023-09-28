resource "newrelic_alert_policy" "ses_alert_policy" {
  name = "SES alert policy"
  incident_preference = "PER_CONDITION_AND_TARGET"
}