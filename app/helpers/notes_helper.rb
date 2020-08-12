module NotesHelper

  def text_from_note(note)
    Nokogiri::HTML::Document.parse(note.body.body.to_s).text.gsub(/\s+/, " ")
  end

end
