class ContactList
  def initialize
    @contacts = []
  end

  def add_phone_numbers(contact)
    # Adds one list of phone numbers to another
    @contacts.concat(contact)
  end

  def list_of_numbers
    # Returns a list of phone numbers
    @contacts
  end
end