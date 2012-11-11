require 'rubygems'
require 'bundler'
require 'bundler/setup'

require 'rake/clean'
require 'flashsdk'
require 'asunit4'

##
# Set USE_FCSH to true in order to use FCSH for all compile tasks.
#
# You can also set this value by calling the :fcsh task 
# manually like:
#
#   rake fcsh run
#
# These values can also be sent from the command line like:
#
#   rake run FCSH_PKG_NAME=flex3
#
# ENV['USE_FCSH']         = true
# ENV['FCSH_PKG_NAME']    = 'flex4'
# ENV['FCSH_PKG_VERSION'] = '1.0.14.pre'
# ENV['FCSH_PORT']        = 12321

##############################
# SWC

compc "bin/CitrusReload.swc" do |t|
  t.include_sources << 'src'  
  t.source_path << 'src'
  
  t.source_path << 'extra'
  t.source_path << 'vendor/Away3D/src'
  t.source_path << 'vendor/AwayPhysics/src'
  t.source_path << 'vendor/Box2D/Source'
  t.source_path << 'vendor/Signal/src'
  t.source_path << 'vendor/Starling/starling/src'
  
  t.include_sources << 'extra'
  t.include_sources << 'vendor/Away3D/src'
  t.include_sources << 'vendor/AwayPhysics/src'
  t.include_sources << 'vendor/Box2D/Source'
  t.include_sources << 'vendor/Signal/src'
  t.include_sources << 'vendor/Starling/starling/src/starling'
 
  
  
  t.include_libraries << 'vendor/Nape/lib/release_nape.swc'
  t.include_libraries << 'vendor/AwayPhysics/lib'
  
  t.warnings = false
  debug=true
  t.static_link_runtime_shared_libraries = true
end

desc "Compile the SWC file"
task :swc => 'bin/CitrusReload.swc'

##############################
# DOC


asdoc 'doc' do |t|
  t.doc_sources << "src"
  t.source_path << 'src'
  t.source_path << 'vendor/Away3D/src'
  t.source_path << 'vendor/AwayPhysics/src'
  t.source_path << 'vendor/Box2D/Source'
  t.source_path << 'vendor/Signal/src'
  t.source_path << 'vendor/Starling/starling/src'
  t.source_path << 'extra'
  t.library_path << 'vendor/Nape/lib/release_nape.swc'
  t.library_path << 'vendor/AwayPhysics/lib'
end
desc "Generate documentation at doc"


##############################
# DEFAULT
task :default => :swc

