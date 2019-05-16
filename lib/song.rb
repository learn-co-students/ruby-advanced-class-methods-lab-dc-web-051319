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
        song = self.new
        @@all << song
        song
    end
    
    def self.new_by_name(title)
        song = self.new
        song.name = title
        song
    end

    def self.create_by_name(title)
        song = self.new
        song.name = title
        @@all << song
        song
    end

    def self.find_by_name(title)
        @@all.find{ |song| song.name == title }
    end

    def self.find_or_create_by_name(title)
        unless find_by_name(title)
            create_by_name(title)
        else
            find_by_name(title)
        end
    end

    def self.alphabetical
        @@all.sort{ |s1, s2| s1.name <=> s2.name }
    end

    def self.get_metadata(filename)
        metadata = filename.split(' - ')
        metadata[1] = metadata[1].chop.chop.chop.chop
        metadata
    end

    def self.new_from_filename(path)
        song = self.new
        # Ruby throws a self in front of get_metadata here
        # i.e. self.get_metadata
        song.artist_name = get_metadata(path)[0]
        song.name = get_metadata(path)[1]  
        song
    end

    def self.create_from_filename(path)
        song = self.new
        song.artist_name = get_metadata(path)[0]
        song.name = get_metadata(path)[1]  
        @@all << song
        song
    end

    def self.destroy_all
        @@all.clear
    end
end
