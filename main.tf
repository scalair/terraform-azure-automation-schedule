resource "azurerm_automation_schedule" "schedule" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  frequency               = var.frequency
  interval                = var.interval
  start_time              = var.start_time
  expiry_time             = var.expiry_time
  timezone                = var.timezone
  week_days               = var.week_days
  month_days              = var.month_days
  dynamic monthly_occurrence {
    for_each = var.monthly_occurrences
    content {
      day                 = monthly_occurrence.value.day
      occurrence          = monthly_occurrence.value.occurrence
    }
  }
  description             = var.description
}

resource "azurerm_automation_job_schedule" "job_schedule" {
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  schedule_name           = azurerm_automation_schedule.schedule.name
  runbook_name            = var.runbook_name
  parameters              = var.parameters
}
