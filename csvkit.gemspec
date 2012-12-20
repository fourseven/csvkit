# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csvkit/version'

Gem::Specification.new do |gem|
  gem.name          = "csvkit"
  gem.version       = CSVKit::VERSION
  gem.authors       = ["Mathew Hartley"]
  gem.email         = ["matt@route66.sytes.net"]
  gem.description   = %q{Rack middleware to convert a <table> into a csv}
  gem.summary       = %q{Inspired by PDFKit, allows a html page (with a <table>) to be converted to a csv file.}
  gem.homepage      = ""

  gem.add_dependency "nokogiri"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
