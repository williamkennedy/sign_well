# frozen_string_literal: true

require "sign_well/version"
require "faraday"
require "faraday_middleware"

module SignWell
  autoload :Client, "sign_well/client"
  autoload :Resource, "sign_well/resource"

  #Endpoints
  
  autoload :DocumentResource, "sign_well/resources/document_resource"
  autoload :TemplateResource, "sign_well/resources/template_resource"

  # Responder
  autoload :Response, "sign_well/response"

end
