require 'require_all'
require_all 'lib/parsers'
require_all 'lib/generators'

class AccelerateUI
  def initialize
    #TODO: Here we create base variables for all functionality
    @js_dir = 'app/assets/javascripts'
    @style_dir = 'app/assets/stylesheets'

    #TODO: Refactor for call function which will return variables by param. For example - js, css, html.
    @js_parser = JsParser.new
    @css_parser = CssParser.new
    @html_parser = HtmlParser.new
    @js_generator = JsGenerator.new
    @css_generator = CssGenerator.new
    @html_generator = HtmlGenerator.new
  end

  def accelerate
    #TODO: Here we must call all functionality about js, css and about html
    @id_array = []
    @class_array = []

    define_all_entries
    collect_ids
  end

  def define_all_entries
    entries_javascript
    #entries_css
    #entries_html
  end

  def collect_ids
    @js_files.each do |file|
      @id_array += js_file_ids(file)
      #@class_array += js_file_classes(file)
    end

    count_entries
    sorted_array_by_entries
    added_new_ids

    @id_array
  end

  def entries_javascript
    @js_files = Dir.entries(@js_dir).select { |f| !File.directory? f }
  end

  def entries_css
    @css_files = Dir.entries(@style_dir).select { |f| !File.directory? f }
  end

  #should return an array
  def js_file_ids(file)
    f = File.open("#{@js_dir}/#{file}", "r")
    @js_parser.id_parser(IO.read(f))
  end

  def sorted_array_by_entries
    @id_array.sort_by { |id| id[:count] }.reverse!
  end

  def added_new_ids
    unless @id_array.empty?
      count_codded_length(@id_array, 1)
      array_id[:new_name] = (index + 97).chr
    end
  end

  def count_codded_length(number, exponent)
    result_exponent = 0
    exponent_number = 25 ** exponent

    exponent_number.each do
      number[:new_name] = (index + 97).chr
    end
    result = number.length - exponent_number

    result_exponent = count_codded_length(result, exponent + 1) if result >= 0
    result_exponent += 1
  end

  def count_entries
    temp_array = []
    unless @id_array.empty?
      temp_array << { name: @id_array.first, count: @id_array.count(@id_array.first) }
      @id_array.each do |id|
        (temp_array << { name: id, count: @id_array.count(id) }) if find_equals(temp_array, id)
      end

      @id_array = temp_array
    end
  end

  def find_equals(array, element)
    #TODO: Need research about can we use include?
    array.select { |array_element| array_element[:name] == element }.empty?
  end

  def rewrite_file
    #TODO: Here we must create functionality which will return accelerated files
    #file.write("")
    #file.close
  end
end