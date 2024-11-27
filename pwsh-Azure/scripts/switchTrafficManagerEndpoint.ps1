# Automation account must have a assigned managed identity which has the corresponding permissions on the resources.

# Set environment variables.
$subscription = ""
$resourceGroup = ""
$trafficManagerProfile = ""

# Connect to Azure using a managed identity and set subscription context.
Connect-AzAccount -Identity
Set-AzContext -Subscription $subscription

# Get resource object and pass it on variable.
$primaryTrafficManagerEndpoint = Get-AzTrafficManagerEndpoint -Name "Primary" -ProfileName $trafficManagerProfile -ResourceGroupName $resourceGroup -Type AzureEndpoints 
$secondaryTrafficManagerEndpoint = Get-AzTrafficManagerEndpoint -Name "Secondary" -ProfileName $trafficManagerProfile -ResourceGroupName $resourceGroup -Type AzureEndpoints 

# Check and switch the endpoint status.
if ( ($primaryTrafficManagerEndpoint).EndpointStatus -eq "Enabled")
{
    $secondaryTrafficManagerEndpoint | Enable-AzTrafficManagerEndpoint
    $primaryTrafficManagerEndpoint | Disable-AzTrafficManagerEndpoint -Force
}
else
{
    $secondaryTrafficManagerEndpoint | Disable-AzTrafficManagerEndpoint -Force
    $primaryTrafficManagerEndpoint | Enable-AzTrafficManagerEndpoint
}