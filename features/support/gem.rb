module Gem
  def self.source_index
    SourceIndex.new
  end
end

class SourceIndex
  def find_name(gem_name)
    [gem_name]
  end
end
