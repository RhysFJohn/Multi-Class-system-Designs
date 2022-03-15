class DiaryEntry
  def initialize(title, contents) # title, contents are both strings
    @title = title
    @contents = contents
  end

  def title
    # Returns title as a string
    return @title
  end

  def contents
    # Returns contents as a string
    return @contents
  end
end