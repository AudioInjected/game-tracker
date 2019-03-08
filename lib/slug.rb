module Slug
  module InstanceMethods
    def slug
      self.username.downcase.gsub("_", "-")
    end 
  end
  
  module ClassMethods 
    def find_by_slug(slug)
      username = slug.gsub("-", "_").split.map(&:capitalize).join(' ')
      self.where('lower(username) = ?', username.downcase).first
    end 
  end
end 