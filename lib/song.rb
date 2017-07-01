require 'pry'

class Song

  attr_accessor :name, :artist_name, :filename

  @@all = []


  def self.create
      song = self.new
      song.save
      song
      #song = self.new.save.last
  end

  # def self.new_by_name(name)
  #     song = self.new
  #     song.name = name
  #     song
  #   end
  #
  # def self.new_artist_name(artist_name)
  #   song = self.new
  #   song.artist_name = artist_name
  #   song
  # end

  def self.new_by_name(name)
      song = self.new
      song.name = name
      song
  end

  def self.new_by_name_and_artist(name, artist_name)
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song
  end

  # def self.new_artist_name(artist_name)
  #   song = self.new
  #
  #   song
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create_by_name(name)
      song = self.create
      song.name = name
      song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name }
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    song = self.new_by_name_and_artist(arr[1].split(".")[0], arr[0])

    # song.name = filename.split(" - ")
    #song.name = filename
    #song.artist_name = filename.split(" - ")
  end


# Build a class constructor that accepts a filename in the format of " - .mp3", for example "Taylor Swift - Blank Space.mp3". The Song.create_from_filename class method should not only parse the filename correctly but should also save the Song instance that was created.


  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
#
#
# class Person
#   attr_accessor :name
#   @@all = []
#   def self.all
#     @@all
#   end
#
#   def self.create(name)
#     person = self.new
#     person.name = name
#     @@all << person
#   end
# end
