# Automation account must have a assigned managed identity which has the corresponding permissions on the resources.

# Set environment variables.
$resourceGroup = ""
$subscription = ""

# Connect to Azure using a managed identity and set subscription context.
Connect-AzAccount -Identity
Set-AzContext -Subscription $subscription

# Get resource object and pass it on variable.
$applicationGateway = Get-AzApplicationGateway -Name "appgw-xxx-001" -ResourceGroupName $resourceGroup

# Start or stop  the secondary gateway based on the operational state.
if (($secondaryGW).OperationalState -eq "Running")
{
    Stop-AzApplicationGateway -ApplicationGateway $applicationGateway
}
else
{
    Start-AzApplicationGateway -ApplicationGateway $applicationGateway
}