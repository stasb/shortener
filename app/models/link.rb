class Link < ActiveRecord::Base
  attr_accessible :alias, :store

  def self.shorten(link)
    random_gen = (0...5).map{ ('a'..'z').to_a[rand(26)] }.join
    Link.create(:store => link["store"], :alias => random_gen)
  end

end
