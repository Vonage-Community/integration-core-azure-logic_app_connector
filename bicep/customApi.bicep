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
    description: 'The Messages API consolidates and normalises exchanges across all messaging channels. It allows you to use a single API to interact with our various channels such as SMS, MMS, WhatsApp, Viber and Facebook Messenger. The Verify API helps you to implement 2FA (two-factor authentication) in your applications.\n\nContact Support:\n Name: Vonage DevRel\n Email: devrel@vonage.com'
    displayName: 'Vonage'
    iconUri: 'https://raw.githubusercontent.com/Vonage-Community/integration-core-azure-logic_app_connector/main/static/VonageLogo_Symbol_Black_Small.png'
    backendService: {
      serviceUrl: 'https://api.nexmo.com'
    }
    swagger: any({
      'swagger': '2.0'
      'info': { 
        'version': '1.0.0'
        'title': 'Messages & Verify APIs'
        'description': '' 
      }
      'host': 'api.nexmo.com'
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
        '/verify/{format}': {
          'post': {
            'operationId': 'VerifyRequest'
            'summary': 'Request a verification'
            'description':'Use Verify request to generate and send a PIN to your user'
            'consumes': [
              'application/x-www-form-urlencoded'
            ]
            'produces': [
              'application/json'
              'text/xml'
            ]
            'parameters': [
              {
                'name': 'format'
                'description': 'The response format.'
                'in': 'path'
                'required': true
                'type': 'string'
                'x-example': 'json'            
              }
              {
                'description': 'You can find your API key in your [account dashboard](https://dashboard.nexmo.com)'
                'in': 'formData'
                'name': 'api_key'
                'required': true
                'type': 'string'
              }
              {
                'description': 'You can find your API secret in your [account dashboard](https://dashboard.nexmo.com)'
                'in': 'formData'
                'name': 'api_secret'
                'required': true
                'type': 'string'
              }
              {
                'description': 'The mobile or landline phone number to verify. Unless you are setting `country` explicitly, this number must be in [E.164](https://en.wikipedia.org/wiki/E.164) format.'
                'in': 'formData'
                'name': 'number'
                'required': true
                'type': 'string'
              }
              {
                'description': 'If you do not provide `number` in international format or you are not sure if `number` is correctly formatted, specify the two-character country code in `country`. Verify will then format the number for you.'
                'in': 'formData'
                'name': 'country'
                'type': 'string'
              }
              {
                'description': 'An 18-character alphanumeric string you can use to personalize the verification request SMS body, to help users identify your company or application name. For example: "Your `Acme Inc` PIN is ..."'
                'in': 'formData'
                'maxLength': 18
                'name': 'brand'
                'required': true
                'type': 'string'
              }
              {
                'default': 'VERIFY'
                'description': 'An 11-character alphanumeric string that represents the [identity of the sender](https://developer.nexmo.com/messaging/sms/guides/custom-sender-id) of the verification request. Depending on the destination of the phone number you are sending the verification SMS to, restrictions might apply.'
                'in': 'formData'
                'maxLength': 11
                'name': 'sender_id'
                'type': 'string'
              }
              {
                'default': 4
                'description': 'The length of the verification code.'
                'enum':[
                  4
                  6
                ]
                'in': 'formData'
                'name': 'code_length'
                'type': 'integer'
              }
              {
                'default': 'en-us'
                'description': 'By default, the SMS or text-to-speech (TTS) message is generated in the locale that matches the `number`. For example, the text message or TTS message for a `33*` number is sent in French. Use this parameter to explicitly control the language used for the Verify request. A list of languages is available: <https://developer.vonage.com/verify/guides/verify-languages>'
                'enum':[
                  'ar-xa'
                  'cs-cz'
                  'cy-cy'
                  'cy-gb'
                  'da-dk'
                  'de-de'
                  'el-gr'
                  'en-au'
                  'en-gb'
                  'en-in'
                  'en-us'
                  'es-es'
                  'es-mx'
                  'es-us'
                  'fi-fi'
                  'fil-ph'
                  'fr-ca'
                  'fr-fr'
                  'hi-in'
                  'hu-hu'
                  'id-id'
                  'is-is'
                  'it-it'
                  'ja-jp'
                  'ko-kr'
                  'nb-no'
                  'nl-nl'
                  'pl-pl'
                  'pt-br'
                  'pt-pt'
                  'ro-ro'
                  'ru-ru'
                  'sv-se'
                  'th-th'
                  'tr-tr'
                  'vi-vn'
                  'yue-cn'
                  'zh-cn'
                  'zh-tw'
                ]
                'in': 'formData'
                'name': 'lg'
                'type': 'string'
              }
              {
                'default': 300
                'description': 'How long the generated verification code is valid for, in seconds. When you specify both `pin_expiry` and `next_event_wait` then `pin_expiry` must be an integer multiple of `next_event_wait` otherwise `pin_expiry` is defaulted to equal next_event_wait. See [changing the event timings](https://developer.nexmo.com/verify/guides/changing-default-timings).'
                'in': 'formData'
                'maximum': 3600
                'minimum': 60
                'name': 'pin_expiry'
                'type': 'integer'
              }
              {
                'default': 300
                'description': 'Specifies the wait time in seconds between attempts to deliver the verification code.'
                'in': 'formData'
                'maximum': 900
                'minimum': 60
                'name': 'next_event_wait'
                'type': 'integer'
              }
              {
                'default': 1
                'description': 'Selects the predefined sequence of SMS and TTS (Text To Speech) actions to use in order to convey the PIN to your user. For example, an id of 1 identifies the workflow SMS - TTS - TTS. For a list of all workflows and their associated ids, please visit the [developer portal](https://developer.nexmo.com/verify/guides/workflows-and-events).'
                'enum': [
                  1
                  2
                  3
                  4
                  5
                  6
                  7
                ]
                'in': 'formData'
                'name': 'workflow_id'
                'type': 'integer'
              }
            ]
            'responses': {
              '200':{
                'description': 'OK'
                'schema': {}
              }
            }
          }
        }
        '/verify/check/{format}': {
          'post': {
            'operationId': 'VerifyCheck'
            'summary': 'Verify check'
            'description':'Use Verify check to confirm that the PIN you received from your user matches the one sent by Vonage in your Verify request.'
            'consumes': [
              'application/x-www-form-urlencoded'
            ]
            'produces': [
              'application/json'
              'text/xml'
            ]
            'parameters':[
              {
                'description': 'The response format'
                'enum': [
                  'json'
                  'xml'
                ]
                'in': 'path'
                'name': 'format'
                'required': true
                'type': 'string'
                'x-example': 'json'
              }
              {
                'in': 'formData'
                'name': 'api_key'
                'required': true
                'type': 'string'
              }
              {
                'in': 'formData'
                'name': 'api_secret'
                'required': true
                'type': 'string'
              }
              {
                'in': 'formData'
                'name': 'request_id'
                'required': true
                'type': 'string'
                'maximum': 32
              }
              {
                'in': 'formData'
                'name': 'code'
                'required': true
                'type': 'string'
                'maximum': 6
                'minimum': 4
              }
            ]
            'responses':{
              '200':{
                'description': 'OK'
                'schema':{
                  'type': 'object'
                  'properties':{
                    'request_id': {
                      'type': 'string'
                    }
                    'event_id': {
                      'type': 'string'
                    }
                    'status': {
                      'type': 'string'
                    }
                    'price': {
                      'type': 'string'
                    }
                    'currency': {
                      'type': 'string'
                    }
                    'estimated_price_messages_sent': {
                      'type': 'string'
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
