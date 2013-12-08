class JsParser
  def initialize
    @id_array = []
    @class_array = []
  end

  def id_parser(file_content)
    @id_array = file_content.scan(/\#[^'".,\s]*/)
  end

  def class_parser(file_content)
    #TODO: make this shit working, for now this matcher not cool enough
    @class_array = file_content.scan(/\.[^'",.\s]/*)

  end
end