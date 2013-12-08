class CssParser
  def initialize
    @id_array = []
    @class_array = []
  end

  def id_parser(file_content)
    @id_array = file_content.scan(/\#[^'",.\s]*/)
  end

  def class_parser(file_content)
    @class_array = file_content.scan(/\.[^'".,\s]*/)

  end

end