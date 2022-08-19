class TodoList
    def initialize
      @todo_list = []
    end
  
    def add(task)
      # Adds todo task to a list
      # Returns nothing
      @todo_list << task
    end
  
    def add_phone_call_tasks(contact) # contact is an array
      # Adds a task to the list for each phone number
      # Returns nothing
      contact.each do |element|
        @todo_list << "Call - #{element}"
      end
    end
  
    def list_of_tasks
      # Returns a list of incomplete tasks
      @todo_list
    end
end