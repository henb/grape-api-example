require "grape-swagger"

module API::Mobile
  class Root < Grape::API
    prefix 'mobile'
    version 'v1', using: :path
    format :json

    helpers API::Mobile::Helpers::RootHelper

    rescue_from :all do |e|
      message = e.message.gsub(/\s*\[.*\Z/, '')
      Rack::Response.new([{ error_message: e.message, status: 'error' }.to_json],
                         e.respond_to?(:status) ? e.status : 500,
                         'Content-Type' => 'application/json').finish
    end

    get :ping do
      { status: 'ok' }
    end

    mount Posts

    add_swagger_documentation api_version: "v1",
                              mount_path:"/api/doc",
                              hide_documentation_path: "/api/doc/swagger_doc",
                              info: { title:       "Mobile API by henb",
                                      description: 'This is simple grape-api-example',
                                      contact:     "henb2015@gmail.com",
                                      license:     "henb2015",
                                      license_url: "https://github.com/henb" },
                              markdown: true

  end
end
