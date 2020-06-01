output "schedule_name" {
  value = azurerm_automation_schedule.schedule.name
}

output "automation_account_name" {
  value = azurerm_automation_schedule.schedule.automation_account_name
}