class Link < ActiveRecord::Base
  attr_accessible :alias, :store

  validates_uniqueness_of :alias, :on => :create
  validates :store, :presence => true

  def self.shorten(link)

    random_gen = Array.new(6){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join

    while Link.find_by_alias(random_gen) do
      random_gen = Array.new(6){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    end

    Link.create(:store => link["store"], :alias => random_gen)

  end

end
