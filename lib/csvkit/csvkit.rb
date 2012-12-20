class CSVKit
  require 'nokogiri'

  attr_accessor :content

  attr_reader :options

  def initialize(body_content, options = {})
    @content = body_content

    @options = options
  end

  def to_csv

    doc = Nokogiri::HTML(@content)

    result = ""

    doc.xpath('//table//tr').each do |row|
      row.xpath('td').each do |cell|
        result += '"' + cell.text.gsub("\n", ' ').gsub('"', '\"').gsub(/(\s){2,}/m, '\1').gsub(/\,\$/, '') + "\", "
      end
      result += "\n"
    end

    raise "command failed: #{invoke}" if result.to_s.strip.empty?
    return result
  end

end
