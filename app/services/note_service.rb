class NoteService
  extend NotesHelper

  # Params not desired to build/update a note object
  PARAMS_BLACK_LIST = %w[id].freeze
  EXCEPTIONS_WHEN_CLONING = %w[id created_at updated_at].freeze

  # Method to build a note based on given parameters
  def self.build_note(params)
    # Gets the association parameters
    filtered_params = clean_parameters(params)

    # Build the note based on simple attributes
    note = Note.new(filtered_params)

    # Returns the built object
    note
  end

  # Method to update a note based on params descriptor
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

  def self.generate_clone_from_original(original_note)
    new_note = Note.new(original_note.attributes.except(*EXCEPTIONS_WHEN_CLONING))
    timestamp = I18n.l(Time.zone.now, format: '%Y-%m-%d-%I%M%S')
    new_note.title = get_timestamped_field(original_note.title, timestamp)
    new_note
  end

  # Cleans parameters not applicable to note attributes
  def self.clean_parameters(params, blacklist = PARAMS_BLACK_LIST)
    params.reject do |param_key, _|
      param_key.in?(blacklist)
    end
  end

  def self.get_timestamped_field(field, timestamp)
    possible_old_timestamp = field.last(timestamp.length)
    valid_timestamp?(possible_old_timestamp) ? field.gsub(possible_old_timestamp, timestamp) : "#{field}_#{timestamp}"
  end

  def self.valid_timestamp?(string)
    format_ok = string.match(/\d{4}-\d{2}-\d{2}-\d{6}/).present?
    parseable = Date.strptime(string, '%Y-%m-%d-%I%M%S').present? rescue false
    (format_ok && parseable)
  end

  private_class_method :clean_parameters, :get_timestamped_field, :valid_timestamp?
end