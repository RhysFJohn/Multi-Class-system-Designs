class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def entries
    # Returns a list of DiaryEntries
    return @entries
  end
end