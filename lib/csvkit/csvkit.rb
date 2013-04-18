class CSVKit
  require 'nokogiri'
  require 'csv'

  attr_accessor :content

  attr_reader :options

  def initialize(body_content, options = {})
    @content = body_content

    @options = options
  end

  def to_csv

    doc = Nokogiri::HTML(@content)

    tsv_str = CSV.generate(col_sep: "\t", headers: :first_row, encoding: 'utf-8') do |tsv|
      doc.xpath('//table//tr').each do |row|
        tsv_row = []
        row.xpath('td | th').each do |cell|
          repeat = header_with_colspan?(cell) ? cell['colspan'].to_i : 1
          repeat.times do
            # if a link show href instead of text.
            if a_link = cell.search('a').first
              text = a_link['href']
            else
              text = cell.text
            end
            tsv_row << clean_cell_string(text)
          end
        end
        tsv << tsv_row
      end
    end

    raise "command failed" if tsv_str.to_s.strip.empty?

    write_content = "\xEF\xBB\xBF".encode!(Encoding::UTF_16LE, Encoding::UTF_8, invalid: :replace, undef: :replace, replace: '')
    write_content += tsv_str.encode!(Encoding::UTF_16LE, Encoding::UTF_8, invalid: :replace, undef: :replace, replace: '')
    return write_content
  end

  def clean_cell_string(cell_string)
    cell_string = cell_string.gsub(/[[:space:]]/, ' ')
    cell_string = cell_string.gsub("\n", ' ')
    cell_string = cell_string.gsub('"', '\"')
    cell_string = cell_string.gsub(/(\s){2,}/m, '\1')
    cell_string = cell_string.gsub(/[\,\$]/, '')
    is_numeric?(cell_string) ? cell_string.to_b : cell_string.strip
  end

  def header_with_colspan?(cell)
    'th' == cell.name && cell.key?('colspan')
  end

  def is_numeric?(string)
    return true if self =~ /^\d+$/
    true if Float(self) rescue false
  end
end
