require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'core_source'
  spec.version                   =  '0.2.9'

  spec.summary                   =  "Fork of ruby_core_source modified to support CFLAGS and permit use of whichever build system (mkmf, rpmkmf, or other modules) while utilizing core source."
  spec.description               =  "Fork of ruby_core_source modified to support CFLAGS and permit use of whichever build system (mkmf, rpmkmf, or other modules) while utilizing core source. This fork was created because the existing ruby_core_source takes over the build definition, preventing definition of CFLAGS and other settings that mkmf requires be defined by an enclosing block."
  
  spec.authors                   =  [ 'Jarod Reid' ]
  spec.email                     =  'jarod@solidalchemy.com'
  spec.homepage                  =  'http://github.com/fugufish/core-source'
  
  spec.add_dependency               'minitar'

  spec.date                      =  Date.today.to_s
  
  # ensure the gem is built out of versioned files
  # also make sure we include the bundle since we exclude it from git storage
  spec.files                     = Dir[ 'install.rb',
                                        '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*' ] & `git ls-files -z`.split("\0")

end
