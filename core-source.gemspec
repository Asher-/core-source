# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{core-source}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Asher"]
  s.date = %q{2010-08-24}
  s.description = %q{Fork of ruby_core_source modified to support CFLAGS and permit use of
whichever build system (mkmf, rpmkmf, or other modules) while utilizing
core source.

This fork was created because the existing ruby_core_source takes over
the build definition, preventing definition of CFLAGS and other settings
that mkmf requires be defined by an enclosing block.}
  s.email = ["asher@ridiculouspower.com"]
  s.extra_rdoc_files = ["Manifest.txt", "CHANGELOG.rdoc", "README.rdoc", "VERSION.rdoc"]
  s.files = ["CHANGELOG.rdoc", "Makefile", "Manifest.txt", "README.rdoc", "Rakefile", "VERSION.rdoc", "core-source.gemspec", "lib/VERSION.rdoc", "lib/contrib/progressbar.rb", "lib/contrib/uri_ext.rb", "lib/core-source.rb"]
  s.homepage = %q{http://rubygems.org/gems/weakhash}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asher}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Fork of ruby_core_source modified to support CFLAGS and permit use of whichever build system (mkmf, rpmkmf, or other modules) while utilizing core source}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.1"])
    else
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.6.1"])
    end
  else
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.6.1"])
  end
end
