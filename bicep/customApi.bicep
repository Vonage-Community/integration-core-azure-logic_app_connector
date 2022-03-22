param location string

@minLength(3)
@maxLength(11)
param name string

resource customApi 'Microsoft.Web/customApis@2016-06-01' ={
  name: name
  location: location
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  etag: 'string'
  properties: {
    apiDefinitions: {
      modifiedSwaggerUrl: 'string'
      originalSwaggerUrl: 'string'
    }
    apiType: 'string'
    backendService: {
      serviceUrl: 'string'
    }
    brandColor: 'string'
    capabilities: [
      'string'
    ]
    connectionParameters: {}
    description: 'string'
    displayName: 'string'
    iconUri: 'string'
    runtimeUrls: [
      'string'
    ]
    swagger: {}
  }
}
