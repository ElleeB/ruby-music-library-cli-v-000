class Artist

  extend Concerns::Findable

  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def find_song(song)
    self.songs.find{|s| song == song}
  end

  def add_song(song)
    if song.artist == self
      self.find_song(song) ? nil : @songs << song
    else
      song.artist = self
      self.find_song(song) ? nil : @songs << song
    end
  end

  def genres
    #iterate over song collection and collect genres without repeating
    collection = []
    @songs.collect{|s| collection << s.genre}
    collection.uniq
  end


  #binding.pry

end
