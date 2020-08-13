class ApplicationController < ActionController::Base
  include Pagy::Backend

  layout :layout_by_resource

  protect_from_forgery
  before_action :authenticate_user!

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    notes_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_session_path(resource_or_scope)
  end

end
