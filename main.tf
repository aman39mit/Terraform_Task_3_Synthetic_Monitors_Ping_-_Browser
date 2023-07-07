resource "newrelic_synthetics_monitor" "simple_monitor" {
  for_each = var.synthetic_monitor_data
  status   = each.value.status
  name     = each.value.name
  period   = each.value.period
  uri      = each.value.uri
  type     = each.value.type

  locations_public = [for i in each.value.locations_public:i]

 

  treat_redirect_as_failure = true
  validation_string         = "success"
  bypass_head_request       = true
  verify_ssl                = true

}

resource "newrelic_synthetics_monitor" "browser_monitor" {
  for_each = var.synthetic_monitor2_data
  status   = each.value.status
  name     = each.value.name
  period   = each.value.period
  uri      = each.value.uri
  type     = each.value.type
  locations_public = [for i in each.value.locations_public:i]

 

  enable_screenshot_on_failure_and_script = true
  validation_string                       = "success"
  verify_ssl                              = true

 
}