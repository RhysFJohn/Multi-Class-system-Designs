class PhoneNumberCrawler
  def initialize(diary) # diary is an instance of Diary
    @diary = diary
  end

  def extract_numbers
    # Returns a list of strings representing phone numbers
    # gathered across all diary entries
    @diary.entries.flat_map do |entry|
      extract_numbers_from_entry(entry)
    end.uniq
  end

  private

  def extract_numbers_from_entry(entry)
    return entry.contents.scan(/07[0-9]{9}/)
  end
end