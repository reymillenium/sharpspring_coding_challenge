module NoteHelper
  extend self

  # Display value if applicable
  def if_applicable(value, titleize: true, not_applicable: t('messages.not_applicable'), attribute: nil)

    # Return not applicable if there is no value
    unless value.present?
      return not_applicable
    end

    # Replace value for an attribute of a given object
    if attribute.present?
      value = value.send(attribute)
    end

    # Apply options
    if titleize
      value = value.to_s.titleize
    end

    # Return the enhanced value
    value
  end

end