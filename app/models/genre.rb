class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name = self.name.gsub(/[^0-9A-Za-z ]/, '')
    #binding.pry
    name ? name.downcase.gsub(" ", "-") : self.name
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end

end
