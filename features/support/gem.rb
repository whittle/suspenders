module Gem
  extend self
  def source_index
    SourceIndex.new
  end
end

class SourceIndex
  def find_name(gem_name)
    @@installed_gems.select { |gem| gem == gem_name }
  end

  def self.fake_install_gem(gem_name)
    (@@installed_gems ||= []) << gem_name
  end

  def self.fake_uninstall_gem(gem_name)
    (@@installed_gems ||= []).delete(gem_name)
  end

  def self.clear_installed_gems
    @@installed_gems = []
  end
end
