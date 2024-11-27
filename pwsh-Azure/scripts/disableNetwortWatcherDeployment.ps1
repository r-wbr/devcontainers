# Register the "Microsoft.Network" resource provider.
Register-AzResourceProvider -ProviderNamespace 'Microsoft.Network'

# Register the "DisableNetworkWatcherAutocreation" feature.
Register-AzProviderFeature -FeatureName 'DisableNetworkWatcherAutocreation' -ProviderNamespace 'Microsoft.Network'