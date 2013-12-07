class JsGenerator
  def id_generator(file_path, id_array)
    content = ''
    file_content = IO.read(File.open(file_path, "r"))

    id_array.each do |id|
      string_for_replace = content.blank? ? file_content : content
      content = string_for_replace.gsub(id[:name], id[:new_name])
    end

    file = File.open(file_path, "w+")
    file.puts content
    file.close
  end

  def class_generator(file_content)

  end
end