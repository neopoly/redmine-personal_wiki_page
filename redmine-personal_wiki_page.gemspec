# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "personal_wiki_page/version"
require "personal_wiki_page/infos"

Gem::Specification.new do |spec|
  spec.name          = "redmine-personal_wiki_page"
  spec.version       = PersonalWikiPage::VERSION
  spec.authors       = PersonalWikiPage::Infos::AUTHORS.keys
  spec.email         = PersonalWikiPage::Infos::AUTHORS.values
  spec.summary       = PersonalWikiPage::Infos::DESCRIPTION
  spec.description   = PersonalWikiPage::Infos::DESCRIPTION
  spec.homepage      = PersonalWikiPage::Infos::URL
  spec.license       = PersonalWikiPage::Infos::LICENSE

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.0"
  spec.add_dependency "redmine-more_view_hooks"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
end
