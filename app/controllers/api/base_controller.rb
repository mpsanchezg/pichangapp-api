class Api::BaseController < PowerApi::BaseController
  protect_from_forgery with: :null_session
end
