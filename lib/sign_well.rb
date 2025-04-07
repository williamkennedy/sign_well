# frozen_string_literal: true

require 'sign_well/version'
require 'faraday'

module SignWell
  autoload :Client, 'sign_well/client'
  autoload :Resource, 'sign_well/resource'

  # Endpoints

  autoload :DocumentResource, 'sign_well/resources/document_resource'
  autoload :TemplateResource, 'sign_well/resources/template_resource'
  autoload :ApiApplicationResource, 'sign_well/resources/api_application_resource'
  autoload :WebHookResource, 'sign_well/resources/web_hook_resource'
  autoload :MeResource, 'sign_well/resources/me_resource'

  # Responder
  autoload :Response, 'sign_well/response'
end
