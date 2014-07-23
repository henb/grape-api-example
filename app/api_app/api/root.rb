module API
  class Root < Grape::API
    format :json

    mount Mobile::Root
  end
end
