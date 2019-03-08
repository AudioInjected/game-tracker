module Slug
  module InstanceMethods
    def slug
      self.username.downcase.gsub(" ", "-")
    end 
  end
  
  module ClassMethods 
    def find_by_slug(slug)
      name = slug.gsub("-", " ").split.map(&:capitalize).join(' ')
      self.where('lower(username) = ?', username.downcase).first
    end 
  end
end 