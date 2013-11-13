# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sane"
  s.version = "0.23.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roger Pack"]
  s.date = "2010-11-11"
  s.description = "Helpers for ruby core to make it easier to work with--things that are missing from core but should arguably be there"
  s.email = ["rogerdpack@gmail.com"]
  s.extra_rdoc_files = ["ChangeLog", "README", "TODO"]
  s.files = ["ChangeLog", "README", "TODO"]
  s.homepage = "http://github.com/rogerdpack/sane_ruby"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.2"
  s.summary = "Helpers for ruby core to make it easier to work with--things that are missing from core but should arguably be there"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<os>, [">= 0"])
      s.add_runtime_dependency(%q<andand>, [">= 0"])
    else
      s.add_dependency(%q<os>, [">= 0"])
      s.add_dependency(%q<andand>, [">= 0"])
    end
  else
    s.add_dependency(%q<os>, [">= 0"])
    s.add_dependency(%q<andand>, [">= 0"])
  end
end
