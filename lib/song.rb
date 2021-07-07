require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #all instances of song
  def self.all
    @@all
  end

  #initialize method (with optional name)
  def initialize(name=nil,artist_name=nil)
    @name = name
    @artist_name = artist_name
  end

  #save the songs
  def save
    self.class.all << self
  end

  #create a new instance of song
  def self.create
    new_song = self.new
    @@all << new_song
    return new_song
  end

  #create a new song by the name
  def self.new_by_name(new_name)
    new_song = self.new(new_name)
  end

  #create new song by name and add to all songs
  def self.create_by_name(new_name)
    new_song = self.new(new_name)
    @@all << new_song
    return new_song
  end

  #find a song by the name
  def self.find_by_name(name)
    song = @@all.find do |item|
      item.name.to_s == name
    end
  end

  #find a song, if it doesn't exist, create it
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      return self.find_by_name(name)
    end
  end

  #sort songs alphabetically
  def self.alphabetical
    @@all.sort do |a,b|
      a.name <=> b.name
    end
  end

  #create a new song from a filename
  def self.new_from_filename(filename)
    filename = filename.split("-")
    artist = filename[0]
    del_at = artist.index(" ") - 1
    artist = artist[0..del_at]
    song = filename[1]
    del_at = song.index(".") - 1
    song = song[1..del_at]
    
    new_song = self.new(song,artist)
    return new_song
  end

  #creating a new song instance from the filename
  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)

    @@all << new_song
  end

  #clear all instances of song
  def self.destroy_all
    @@all.clear
  end

end
