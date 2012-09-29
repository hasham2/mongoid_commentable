require 'comment'
require 'active_support/dependencies'
require File.join(File.dirname(__FILE__), 'mongoid/commentable')
%w{ controllers }.each do |dir|
  path = File.join(File.dirname(__FILE__), '../app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

