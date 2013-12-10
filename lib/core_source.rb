if RUBY_VERSION.to_f < 1.9
  def require_relative(file)
    require File.expand_path('../' + file, __FILE__)
  end
end


require_relative 'contrib/uri_ext.rb'
require_relative 'contrib/progressbar.rb'

require 'rbconfig'
require 'yaml'
require 'archive/tar/minitar'
require 'zlib'
require 'fileutils'
require 'tmpdir'
require 'tempfile'

STATUS_BAR_WIDTH	=	80

def ensure_core_headers( headers )

  unless headers.select { |header| have_header( header ) }.empty?
    return true
  end
	
  ruby_dir = ""
  if RUBY_PATCHLEVEL < 0
    Tempfile.open("preview-revision") { |temp|
			uri_path = "http://cloud.github.com/downloads/mark-moseley/ruby_core_source/preview_revision.yml"
      uri = URI.parse(uri_path)
			uri.download(temp, {:progress => true})
			revision_map = YAML::load(File.open(temp.path))
      ruby_dir = revision_map[RUBY_REVISION]
      return false if ruby_dir.nil?
    }
  else
    ruby_dir = "ruby-" + RUBY_VERSION.to_s + "-p" + RUBY_PATCHLEVEL.to_s
  end

  version_path  = '1.8' if RUBY_VERSION.to_f >= 1.8
  version_path  = '1.9' if RUBY_VERSION.to_f >= 1.9
  version_path  = '2.0' if RUBY_VERSION.to_f >= 2.0


  #
  # Download the headers
  #
  uri_path = "http://ftp.ruby-lang.org/pub/ruby/#{version_path}/" + ruby_dir + ".tar.gz"
  Tempfile.open("ruby-src") { |temp|

    temp.binmode
    uri = URI.parse(uri_path)
		uri.download(temp, {:progress => true})
		
    tgz = Zlib::GzipReader.new(File.open(temp, "rb"))

    Dir.mktmpdir { |dir|
      inc_dir = dir + "/" + ruby_dir + "/*.inc"
      hdr_dir = dir + "/" + ruby_dir + "/*.h"
      Archive::Tar::Minitar.unpack(tgz, dir)
      FileUtils.cp( Dir.glob([ inc_dir, hdr_dir ] ), Config::CONFIG["rubyhdrdir"])
    }
  }

  return true unless headers.select { |header| have_header( header ) }.empty?
  
	raise LoadError 'Could not find core headers ' + headers.join( ', ' ) + '.'
  
  
end

