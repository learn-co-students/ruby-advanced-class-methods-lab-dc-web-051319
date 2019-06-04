require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="")
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort{|song1, song2| song1.name <=> song2.name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(file)
    arr = file.split(' - ')
    artist = arr[0]
    name = arr[1].split(".")[0]
    song = self.new_by_name(name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    arr = file.split(' - ')
    artist = arr[0]
    name = arr[1].split(".")[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end

end
#
# song = Song.create_by_name("Blank Space")
# binding.pry

# p song
