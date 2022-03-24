targetScope = 'resourceGroup'

// set the params
param namePrefix string
param location string = resourceGroup().location

// set local var
var logicAppConnectorName = '${namePrefix}-lac'


module customApi 'customApi.bicep' = {
  name: logicAppConnectorName
  scope: resourceGroup()
  params:{
    location: location
    name: logicAppConnectorName
  }
}
