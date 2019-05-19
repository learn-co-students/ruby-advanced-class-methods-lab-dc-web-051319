class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    # song = Song.new
    # song.save
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song_instance|
      song_instance.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end



  def self.new_from_filename(filename)
    file_parts = filename.split(/[-.]/)
    artist = file_parts[0].strip
    song_title = file_parts[1].strip

    song = Song.new
    song.name = song_title
    song.artist_name = artist
    song

  end

  def self.create_from_filename(filename)
    file_parts = filename.split(/[-.]/)
    artist = file_parts[0].strip
    song_title = file_parts[1].strip

    song = Song.create
    song.name = song_title
    song.artist_name = artist
    song

  end

  def self.destroy_all
    self.all.clear
  end

end
