module CommonControl
  extend ActiveSupport::Concern
  include CommonHelper

  # Updates the return to path
  def update_concerned_path
    @return_to = params[:return_to]
  end

end