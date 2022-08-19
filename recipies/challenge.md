{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary


As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries


2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

DiaryEntry --> Diary
           --> Contacts

Todo --> TodoList

Contacts --> ContactList
         --> TodoList

DiaryEntry(title, contents)
- title
- contents
- count_words

Diary
- add(DiaryEntry)
- reading_time(wpm)
- select_entry_for_reading_time(wpm, minutes)

Contact(DiaryEntry)
- get_phone_numbers
- list_of_numbers

ContactList
- add_phone_numbers(contacts)
- list_of_numbers

Todo(task)
- task

TodoList
- add(Todo)
- add_phone_call_tasks(contact)
- list_of_tasks


Also design the interface of each class in more detail.

```ruby
class DiaryEntry
  def initialize(title,contents)
  #...
  end

  def title
    # Returns title as string
  end

  def contents
    # Returns contents as string
  end

  def count_words 
   # counts the number of words in contents
  end
end

class Diary
  def initialize
    #...
  end

  def add(entry) # entry is a string
    # Adds entry to list of entries
    # Returns nothing
  end

  def reading_time(wpm)
    # returns the time required to read an entry as an integer
  end

  def select_entry_for_reading_time(wpm, minutes) # wpm is an integer
                                                  # minutes is an integer
    # Returns the longest posible entry that can be read in the available time
  end
end

class Contact
  def initialize(DiaryEntry)
    #...
  end

  def get_phone_numbers
    # Extracts phone numbers from a string and adds the numbers to a list
    # Returns nothing
  end

  def list_of_numbers
    # Returns a list of phone numbers
  end
end

class ContactList
  def initialize
    #...
  end

  def add_phone_numbers(contact)
    # Adds one list of phone numbers to another
  end

  def list_of_numbers
    # Returns a list of phone numbers
  end
end

class Todo
  def initialize(task)
    #...
  end

  def task
    # Returns task as a string
  end
end

class TodoList
  def initialize
    #...
  end

  def add(Todo)
    # Adds todo task to a list
    # Returns nothing
  end

  def add_phone_call_tasks(contact) # contact is an array
    # Adds a task to the list for each phone number
    # Returns nothing
  end

  def list_of_tasks
    # Returns a list of incomplete tasks
  end
end
```

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# this is how it works inside my head!
# Add new diary entries and add phone numbers from each entry to the contact list, add the phone numbers 
# directly from contact to the todo list, add a new task to the todo list
```ruby
diary = Diary.new
diary_entry_1 = DiaryEntry.new("Day_1", "Got my first car! Salesman, 07654915554")
diary_entry_2 = DiaryEntry.new("Day_2", "Got a good mechanic's number, 07955117614. Insurance 07965870126")
diary.add(diary_entry_1)
diary.add(diary_entry_2)
contact_list = ContactList.new
contacts_1 = Contact.new(diary_entry_1)
contacts_2 = Contact.new(diary_entry_2)
contact_list.add_phone_numbers(contacts_1) 
contact_list.add_phone_numbers(contacts_2)
phone_numbers = contacts_2.list_of_numbers
todo_list = TodoList.new
task = Todo.new("Wash the car!")
todo_list.add_phone_call_tasks(phone_numbers)
todo_list.add(task)
diary.select_entry_for_reading_time(2, 4) # => [diary_entry_1]
diary.select_entry_for_reading_time(2, 5) # => [diary_entry_2]
contact_list.list_of_numbers # => ["07654915554", "07955117614", "07965870126"]
todo_list.list_of_tasks # => ["Call - 07955117614", "Call - 07965870126", task]

```

4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# Blank diary entry
```ruby
DiaryEntry.new("") # fail "Blank diary entry"
```

# No phone numbers in array for ContactList.add_phone_numbers
```ruby
ContactList.add_phone_numbers(["Not a phone number"]) #fail "no phone numbers in list"
```
# No phone numbers in array for TodoList.add_phone_call_tasks
```ruby
TodoList.add_phone_call_tasks(["Not a phone number"]) #fail "no phone numbers in list"
```
# Blank task list item 
```ruby
Todo.new("") # fail "Blank task item"
```
Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.
