class JsParser
  def initialize
    @id_array = []
    @class_array = []
  end

  def id_parser(file_content)
    @id_array = file_content.scan(/#[^']*/).map { |e| e.delete '#' }
  end

  def class_parser(file_content)

  end
end