class DiaryEntry
  def initialize(title,contents)
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def reading_time(wpm)
    (count_words/wpm.to_f).ceil
  end

  def count_words 
   contents.split(" ").length
  end
end