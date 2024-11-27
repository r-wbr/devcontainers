# Set environment variables.
$subscription = ""
$tagName = ""
$tagValue = ""

# Connect to Azure using a user identity and set subscription context.
Connect-AzAccount
Set-AzContext -Subscription $subscription

$subscription | ForEach-Object {
    Set-AzContext $_
    $rs = Get-AzResource -TagName $tagName -TagValue $tagValue
    $rs | ForEach-Object {
        $_.Tags.Remove($tagName)
        $_ | Set-AzResource -Force
    }  
}