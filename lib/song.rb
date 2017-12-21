class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)

    @name = name

    if artist != nil
      self.artist=(artist)
    else
      nil
    end

    if genre != nil
      self.genre=(genre)
    else
      nil
    end

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
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    if self.artist == artist
      artist.add_song(self) ## error artist as string not object
    else
      @artist = artist
      artist.add_song(self) ## error artist as string not object
    end
  end

  def genre=(genre)
    if self.genre == genre
      genre.add_song(self)
    else
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    #returns (does not recreate) an existing song with the provided name if one exists in @@all
    if song = self.find_by_name(name)
      song
    else
      Song.create(name)
    end
  end

  def self.new_from_filename(filename)
  end

  

  #binding.pry


end
