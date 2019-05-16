class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = self.new
    @@all.push(song)
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all.push(song)
    song
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)

    puts song.class
    if song.class == Song
      return song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    name_arr = filename.split(" - ")
    artist_name = name_arr[0]
    name = name_arr[1][0..-5]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    name_arr = filename.split(" - ")
    artist_name = name_arr[0]
    name = name_arr[1][0..-5]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all.push(song)
    song
  end

  def self.destroy_all
    self.all.clear
  end
end


