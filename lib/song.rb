class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = self.new
    song.save
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
      find_by_name(name) || create_by_name(name)  # is saying do this(if it is true) or that (if the first thing is not true and the second thing is true
  end
  
  def self.alphabetical
    @@all.sort_by{|x| x.name} #returns all the songs instances in ascending (a-z) alphabetical order.
  end
  
  def self.new_from_filename(name)
    song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end
  
  def self.create_from_filename(name)
    song = self.new
    song.name = (name.split(" - ")[1].chomp(".mp3"))  #class method should not only parse the filename correctly but should also save the song
    song.artist_name = (name.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear   #reset the state of the @@all class variable to an empty array thereby deleting all previous song instances.
  end
end
