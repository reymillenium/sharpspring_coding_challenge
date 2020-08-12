class NoteService
  # extend CuseumPkpass::PkpassTemplateHelper
  # extend T::Sig
  # include CopyCarrierwaveFile

  # Params not desired to build/update a pkpass_template object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a pkpass_template based on given parameters
  # sig { params(params: ActionController::Parameters).returns(CuseumPkpass::PkpassTemplate) }
  def self.build_note(params)
    # # Gets the association parameters
    # expiration_date = params[:expiration_date].present? ? Time.zone.strptime(params[:expiration_date], Settings::TIME_FORMAT) : ''
    # relevant_date = params[:relevant_date].present? ? Time.zone.strptime(params[:relevant_date], Settings::TIME_FORMAT) : ''
    #
    # filtered_params = clean_parameters(params)
    # filtered_params = compose_style_param_keys(filtered_params)
    #
    # # Build the pkpass_template based on simple attributes
    # pkpass_template = CuseumPkpass::PkpassTemplate.new(filtered_params)
    # pkpass_template.expiration_date = expiration_date
    # pkpass_template.relevant_date = relevant_date
    #
    # # Returns the built object
    # pkpass_template
  end

  # Method to update a pkpass_template based on params descriptor
  # sig { params(params: ActionController::Parameters).returns(CuseumPkpass::PkpassTemplate) }
  def self.update_note(params)
    # # Gets the association parameters
    # pkpass_template = CuseumPkpass::PkpassTemplate.find(params[:id])
    # pkpass_template.expiration_date = params[:expiration_date].present? ? Time.zone.strptime(params[:expiration_date], Settings::TIME_FORMAT) : ''
    # pkpass_template.relevant_date = params[:relevant_date].present? ? Time.zone.strptime(params[:relevant_date], Settings::TIME_FORMAT) : ''
    #
    # filtered_params = clean_parameters(params)
    # filtered_params = compose_style_param_keys(filtered_params)
    # pkpass_template.assign_attributes(filtered_params)
    # pkpass_template
  end

  # sig { params(original_pkpass_template: CuseumPkpass::PkpassTemplate).returns(CuseumPkpass::PkpassTemplate) }
  def self.generate_clone_from_original(original_note)
    new_note = Note.new(original_note.attributes.except(*EXCEPTIONS_WHEN_CLONING))
    timestamp = I18n.l(Time.zone.now, format: '%Y-%m-%d-%I%M%S')
    new_note.title = get_timestamped_field(original_note.title, timestamp)
    new_note
  end

  # Cleans parameters not applicable to pkpass_template attributes
  # sig { params(params: ActionController::Parameters, blacklist: Array).returns(ActionController::Parameters) }
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  # sig { params(field: String, timestamp: String).returns(String) }
  def self.get_timestamped_field(field, timestamp)
    possible_old_timestamp = field.last(timestamp.length)
    valid_timestamp?(possible_old_timestamp) ? field.gsub(possible_old_timestamp, timestamp) : "#{field}_#{timestamp}"
  end

  # sig { params(string: String).returns(T::Boolean) }
  def self.valid_timestamp?(string)
    format_ok = string.match(/\d{4}-\d{2}-\d{2}-\d{6}/).present?
    parseable = Date.strptime(string, '%Y-%m-%d-%I%M%S').present? rescue false
    (format_ok && parseable)
  end

  private_class_method :clean_parameters, :get_timestamped_field, :valid_timestamp?
end