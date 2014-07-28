module API::Mobile::Helpers
  module RootHelper
    def response(code, hash = {})
      if hash[:error_message]
        hash[:status] = 'error'
        error!(hash, code)
      else
        hash[:status] = 'success'
        good_response(hash, code)
      end
    end

    def good_response(hash, code)
      status code
      hash
    end
  end
end
