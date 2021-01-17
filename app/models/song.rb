class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes


  def genre_id=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_id
     self.genre ? self.genre.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ""
        content = self.notes.build(content: note)
        content.save
      end
    end
  end

  #reader for note contents
  def note_contents
    self.notes.collect {|note| note.content }
  end




end
