class Tweet < ActiveRecord::Base
  belongs_to :user
  
  def slug
    self.name.gsub(" ","-").downcase
  end
  
  def self.find_by_slug(slug)
    self.all.find do |tweet|
      tweet.slug == slug
    end
  end
end