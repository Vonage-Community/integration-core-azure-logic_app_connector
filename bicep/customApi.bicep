param location string

@minLength(3)
@maxLength(11)
param name string

resource customApi 'Microsoft.Web/customApis@2016-06-01' = {
  name: name
  location: location
  properties: {
    apiDefinitions: {
      originalSwaggerUrl: 'https://raw.githubusercontent.com/Vonage-Community/integration-core-azure-logic_app_connector/main/static/vonage.core.swagger.yml'
    }
    apiType: 'Rest'
    backendService: {
      serviceUrl: 'string'
    }
    brandColor: '#ffffff'
    capabilities: []
    connectionParameters: {
      username: {
        type: 'securestring'
      }
      password: {
        type: 'securestring'
      }
    }
    description: 'The Messages API consolidates and normalises exchanges across all messaging channels. It allows you to use a single API to interact with our various channels such as SMS, MMS, WhatsApp, Viber and Facebook Messenger\n\nContact Support:\n Name: Vonage DevRel\n Email: devrel@vonage.com'
    displayName: 'Vonage'
    iconUri: 'https://raw.githubusercontent.com/Vonage-Community/integration-core-azure-logic_app_connector/main/static/VonageLogo_Symbol_Black_Small.png'
    runtimeUrls: [
      'string'
    ]
    swagger: {}
  }
}
