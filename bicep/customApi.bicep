param location string

@minLength(3)
@maxLength(11)
param name string

resource customApi 'Microsoft.Web/customApis@2016-06-01' = {
  name: name
  location: location
  properties: {
    apiType: 'Rest'
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
    backendService: {
      serviceUrl: 'https://api.nexmo.com/v1'
    }
    swagger: any({
      'swagger': '2.0'
      'info': { 
        'version': '1.0.0'
        'title': 'Messages API'
        'description': 'The Messages API' 
      }
      'host': 'api.nexmo.com'
      'basePath': '/'
      'schemes': [
        'https'
      ]
      'consumes': []
      'produces': [
        'application/json'
      ]
      'paths': {
        '/v1/messages/': {
          'post': {
            'summary': 'Send a message to the given channel.'
            'description': 'Send a Message'
            'operationId': 'SendAMessageToTheGivenChannel.'
            'parameters': [
              {
                'name': 'Content-Type'
                'in': 'header'
                'required': true
                'type': 'string'
                'default': 'application/json'
                'description': 'Content-Type'
              }
              {
                'name': 'Accept'
                'in': 'header'
                'required': true
                'type': 'string'
                'default': 'application/json'
                'description': 'Accept'
              }
              {
                'name': 'body'
                'in': 'body'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'message_type': {
                      'type': 'string'
                      'description': 'The type of message to send. You must provide text in this field'
                    }
                    'text': {
                      'type': 'string'
                      'description': 'The text of message to send; limited to 1000 characters.'
                    }
                    'to': {
                      'type': 'string'
                      'description': 'The phone number of the message recipient in the E.164 format.'
                    }
                    'from': {
                      'type': 'string'
                      'description': 'The phone number of the message recipient in the E.164 format.'
                    }
                    'channel': {
                      'type': 'string'
                      'description': 'The channel to send to. You must provide sms in this field'
                    }
                    'client_ref': {
                      'type': 'string'
                      'description': 'Client reference of up to 40 characters. The reference will be present in every message status.'
                    }
                  }
                  'default': {
                    'message_type': 'text'
                    'text': 'Hello World'
                    'to': '447123456789'
                  }
                }
              }
            ]
            'responses': {
              '202': {
                'description': '202'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'message_uuid': {
                      'type': 'string'
                      'description': 'message_uuid'
                    }
                  }
                }
              }
              '401': {
                'description': '401'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'type': {
                      'type': 'string'
                      'description': 'type'
                    }
                    'title': {
                      'type': 'string'
                      'description': 'title'
                    }
                    'instance': {
                      'type': 'string'
                      'description': 'instance'
                    }
                    'detail': {
                      'type': 'string'
                      'description': 'detail'
                    }
                  }
                }
              }
              '402': {
                'description': '402'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'type': {
                      'type': 'string'
                      'description': 'type'
                    }
                    'title': {
                      'type': 'string'
                      'description': 'title'
                    }
                    'detail': {
                      'type': 'string'
                      'description': 'detail'
                    }
                    'instance': {
                      'type': 'string'
                      'description': 'instance'
                    }
                  }
                }
              }
              '422': {
                'description': '422'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'type': {
                      'type': 'string'
                      'description': 'type'
                    }
                    'title': {
                      'type': 'string'
                      'description': 'title'
                    }
                    'detail': {
                      'type': 'string'
                      'description': 'detail'
                    }
                    'instance': {
                      'type': 'string'
                      'description': 'instance'
                    }
                  }
                }
              }
              '429': {
                'description': '429'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'type': {
                      'type': 'string'
                      'description': 'type'
                    }
                    'title': {
                      'type': 'string'
                      'description': 'title'
                    }
                    'detail': {
                      'type': 'string'
                      'description': 'detail'
                    }
                    'instance': {
                      'type': 'string'
                      'description': 'instance'
                    }
                  }
                }
              }
              '500': {
                'description': '500'
                'schema': {
                  'type': 'object'
                  'properties': {
                    'type': {
                      'type': 'string'
                      'description': 'type'
                    }
                    'title': {
                      'type': 'string'
                      'description': 'title'
                    }
                    'detail': {
                      'type': 'string'
                      'description': 'detail'
                    }
                    'instance': {
                      'type': 'string'
                      'description': 'instance'
                    }
                  }
                }
              }
            }
          }
        }
      }
      'definitions': {}
      'parameters': {}
      'responses': {}
      'securityDefinitions': {
        'basic_auth': {
          'type': 'basic'
        }
      }
      'security': [
        {
          'basic_auth': []
        }
      ]
      'tags': [] 
    })
  }
}
