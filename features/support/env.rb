require 'spec/expectations'
require 'ruby-debug'
require File.expand_path('../../lib/create', File.dirname(__FILE__))

require File.expand_path('gem', File.dirname(__FILE__))

After('@creates_blog') do
  FileUtils.rm_rf('blog')
  sudos_file = '../support/sudos_used'
  File.delete(sudos_file) if File.exists?(sudos_file)
  SourceIndex.clear_installed_gems
end
