# frozen_string_literal: true

require "classes/version"
require "classes/class_list"
require "classes/helpers"

if defined? Rails::Railtie
  require "classes/railtie"
end

if defined? Sinatra
  require "classes/sinatra"
end
