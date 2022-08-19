class Diary
  def initialize
    @diary_entries = []
  end

  def add(entry)
    @diary_entries << entry
  end

  def reading_time(wpm)
    count_words/wpm.to_f.ceil
  end

  def select_entry_for_reading_time(wpm, minutes) 
    readable = @diary_entries.select do |entry|
      entry.reading_time(wpm) <= minutes
    end
    sort = readable.sort_by do |entry|
      entry.count_words
    end
    sort.last
  end
end
