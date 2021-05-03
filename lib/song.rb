class Song
    attr_accessor :artist, :name
    @@all = []
    def initialize(name)
        @name = name

        @@all << self
    end

    def artist_name=(name)
        if (self.artist.nil?)
            self.artist = Artist.new(name)
        else
            self.artist.name = name
        end
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        artist, song = filename.split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
    
end