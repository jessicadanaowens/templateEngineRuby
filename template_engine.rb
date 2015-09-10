require 'pry-byebug'
class TemplateEngine

  def initialize(data, template)
   @data = data
   @template = template
  end

  def find_matches
   @template.scan(/\%\<([^\%\>]+)?\>\%/)
  end

  def replace_matches_with_data
    matches = find_matches
    new_template = @template
    matches.each do |match|

      new_template = new_template.gsub(match.first, @data[match.first.to_sym])
    end
    new_template = new_template.gsub("%<", "")
    new_template = new_template.gsub(">%", "")
  end
end