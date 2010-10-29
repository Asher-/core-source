require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'core-source'
  spec.rubyforge_project         =  'core-source'
  spec.version                   =  '0.2.4'

  spec.summary                   =  "Fork of ruby_core_source modified to support CFLAGS and permit use of whichever build system (mkmf, rpmkmf, or other modules) while utilizing core source."
  spec.description               =  "Fork of ruby_core_source modified to support CFLAGS and permit use of whichever build system (mkmf, rpmkmf, or other modules) while utilizing core source. This fork was created because the existing ruby_core_source takes over the build definition, preventing definition of CFLAGS and other settings that mkmf requires be defined by an enclosing block."
  
  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/core-source'
  
  spec.date                      =  Date.today.to_s
  
  # ensure the gem is built out of versioned files
  # also make sure we include the bundle since we exclude it from git storage
  spec.files                     = Dir[ 'install.rb',
                                        '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*' ] & `git ls-files -z`.split("\0")

end
