# frozen_string_literal: true

require_relative "alloy_sdk/version"
require "httparty"
require 'securerandom'
require 'faraday'
require 'faraday/net_http'
require 'json'
require 'timeout'
Faraday.default_adapter = :net_http
module AlloySdk
  def self.find(apiKey,workflowId,data,returnExecutionData)

    uuid = SecureRandom.uuid
    responseOfWebHook = Faraday.post("https://webhooks.runalloy.com/#{workflowId}",
    { 
      :body => data.to_json,
      :headers => { 
        'Authorization' => 'Bearer ' +  apiKey,
        'X-Execution-Uuid' => uuid,
        'Accept' => 'application/json',
        'Content-Type' => 'text/html'
      }
    })
    if returnExecutionData === true
      x = 10
 
      # using while loop
      # here conditional is x i.e. 4
      while x >= 1
        Timeout.timeout(5) do
          responseOfWebHookOutput = Faraday.get("https://api.runalloy.com/sdk/output/#{uuid}",{ 
            :body => data.to_json,
            :headers => { 
              'Authorization' => 'Bearer ' +  apiKey,
              'Accept' => 'application/json',
              'Content-Type' => 'text/html'
            }
          })
          puts responseOfWebHookOutput.status

          if responseOfWebHookOutput.status === 200
            return responseOfWebHookOutput.body
          elseif x>=1

          else
            x = x - 1
          end
        end
      # while loop ends here
      end
    else
      return responseOfWebHook
    end
  end
end