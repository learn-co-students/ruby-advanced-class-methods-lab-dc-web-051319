require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name="Unknown",artist="Unknown")
  #   @name=name
  #   @artist_name=artist
  # end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song=self.new
    song.name=name
    song.artist_name
    # binding.pry
    song.save
    song
  end

  def self.new_by_name(name)
    song=self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song=self.new
    song.name=name
    song.save
    # binding.pry
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    # if self.all.collect{|song| song.name}.include?(name)
    #   song = self.find_by_name(name)
    # else
    #   song = self.create_by_name(name)
    # end
    song=self.find_by_name(name)
    self.all.include?(song) ? song : song=self.create_by_name(name)
  end

  def self.alphabetical
    # binding.pry
    self.all.sort_by{|x| x.name}
  end

  def self.new_from_filename(name)
    # binding.pry
    song=self.new
    song.name = name.split(" - ").pop[0...name.split(" - ").pop.length-4]
    song.artist_name=name.split(" - ").shift
    song
  end

  def self.create_from_filename(name)
      # binding.pry
      song=self.new
      song.name = name.split(" - ").pop[0...name.split(" - ").pop.length-4]
      song.artist_name=name.split(" - ").shift
      song.save
      song
    end

    def self.destroy_all
      self.all.clear
    end

end
