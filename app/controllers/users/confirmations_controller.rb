class Users::ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    # super
    sign_in(resource)
    notes_path
  end

  # layout 'login'
end