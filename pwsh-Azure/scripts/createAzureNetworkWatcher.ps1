# Set environment variables.
$resourceGroup = ""
$region = ''
$subscription = ""
$name = 'nw-' + $region

# Connect to Azure using a user identity and set subscription context.
Connect-AzAccount
Set-AzContext -Subscription $subscription

# Create network watcher resource in selected resource group.
New-AzNetworkWatcher -Name $name -ResourceGroupName $resourceGroup -Location $region