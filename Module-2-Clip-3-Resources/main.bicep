var location  = resourceGroup().location
var aksClusterName  = 'akscluster1'
var dnsPrefix = aksClusterName
var osDiskSizeGB  = 128
var agentCount = 1
var agentVMSize = 'Standard_D2s_v3'
var osTypeLinux = 'Linux'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2024-02-01' = {
  location: location
  name: 'akscluster1'
  tags: {
    displayname: 'AKS Cluster'
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enableRBAC: true
    dnsPrefix: dnsPrefix
    agentPoolProfiles: [
      {
        name: 'syspool'
        osDiskSizeGB: osDiskSizeGB
        count: agentCount
        vmSize: agentVMSize
        osType: osTypeLinux
        type: 'VirtualMachineScaleSets'
        mode: 'System'
      }
      {
        name: 'linux'
        osDiskSizeGB: osDiskSizeGB
        count: agentCount
        vmSize: agentVMSize
        osType: osTypeLinux
        type: 'VirtualMachineScaleSets'
        mode: 'User'
      }
    ]
  }
}
