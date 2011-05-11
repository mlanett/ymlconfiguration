require "erb"
require "yaml"

module Ymlconfiguration
  
  module Core
    
    # o can be a map or object which can supply "env" and "root", e.g. Rails or ENV
    def init( o = {} )
      return if @inited
      @env    = ( o.respond_to?(:[]) && ( o["RACK_ENV"] || o["RAILS_ENV"] ) ) || ( o.respond_to?(:env) && o.env ) || "development"
      @root   = ( o.respond_to?(:[]) && ( o["ROOT"] ) ) || ( o.respond_to?(:root) && o.root ) || File.expand_path( "." )
      @config = "#{@root}/config"
      @inited = true
    end  
    
    def yml( name )
      init
      if File.exist?( yml = "#{@config}/#{name}.yml" ) then
        cfg = YAML.load(IO.read( yml )) [env]
      elsif File.exist?( yml = "#{@config}/#{name}.yml.erb" )
        cfg = YAML.load( (ERB.new( IO.read( yml ) ).result) ) [env]
      else
        raise "missing #{@config}/#{name}.yml"
      end
    end
    
  end
  
  extend Core
  
end
