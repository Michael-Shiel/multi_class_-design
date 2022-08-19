class Contact
  def initialize
    @numbers = []
  end

  def get_phone_numbers(diary_entry)
    # Extracts phone numbers from a string and adds the numbers to a list
    # Returns nothing
    content = diary_entry.gsub(/[^a-z0-9\s]/i, '').split(" ")
    # p "Content: #{content}"
    content.select do |word|
      # p "word: #{word if word =~ /07\d{9}/}"
      @numbers << word if word =~ /07\d{9}/
    end
    p "@numbers: #{@numbers}"
    @numbers
  end

  def list_of_numbers
    # Returns a list of phone numbers
    @numbers
  end
end