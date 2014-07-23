module API::Mobile
  class Root < Grape::API
    prefix 'mobile'
    version 'v1', using: :path
    format :json

    post :ping do
      { status: 'ok' }
    end
  end
end
