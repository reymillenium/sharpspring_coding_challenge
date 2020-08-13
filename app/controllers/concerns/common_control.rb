module CommonControl
  extend ActiveSupport::Concern
  include CommonHelper

  included do

    before_action :update_sorting,
                  :update_scope,
                  only: [:index]
  end

  # Updates the return to path
  def update_concerned_path
    @return_to = params[:return_to]
  end

  def update_sorting
    @sort_column = params[:sort_column] || 'created_at'
    @sort_direction = params[:sort_direction] || 'desc'
  end

  # Update scope variable to filter data
  def update_scope
    @scope = params[:scope] || params[:q] || {}
  end

end