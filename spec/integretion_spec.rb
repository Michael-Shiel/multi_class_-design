# this is how it works inside my head!
# Add new diary entries and add phone numbers from each entry to the contact list, add the phone numbers 
# directly from contact to the todo list, add a new task to the todo list
require 'diary'
require 'diary_entry'
require 'todo'
require 'todo_list'
require 'contact'
require 'contact_list'

RSpec.describe 'integration' do
    context 'Add new diary entries' do
        it 'Returns the best entry for given reading time' do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Day_1", "Got my first new car! Salesman, 07654915554")
            diary_entry_2 = DiaryEntry.new("Day_2", "Got a good mechanic's phone number, 07955117614. Insurance 07965870126")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.select_entry_for_reading_time(2, 4)).to eq diary_entry_1
            expect(diary.select_entry_for_reading_time(2, 5)).to eq diary_entry_2
        end
    end

    context 'Add phone numbers from diary entries to contact list' do
        it 'Returns a list of phone numbers' do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Day_1", "Got my first car! Salesman, 07654915554")
            diary_entry_2 = DiaryEntry.new("Day_2", "Got a good mechanic's number, 07955117614. Insurance 07965870126")
            contact = Contact.new
            contact_list = ContactList.new
            contacts = contact.get_phone_numbers(diary_entry_1.contents)
            contacts = contact.get_phone_numbers(diary_entry_2.contents)
            contact_list.add_phone_numbers(contacts) 
            expect(contact_list.list_of_numbers).to eq ["07654915554", "07955117614", "07965870126"]
        end
    end

    context 'creates a list of tasks from contacts and new tasks' do
        it 'Should return a list of two contacts tasks and one further task' do
            diary = Diary.new
            diary_entry = DiaryEntry.new("Day_2", "Got a good mechanic's number, 07955117614. Insurance 07965870126")
            contact_list = ContactList.new
            contact = Contact.new
            contacts = contact.get_phone_numbers(diary_entry.contents)
            contact_list.add_phone_numbers(contacts)
            phone_numbers = contact_list.list_of_numbers
            todo_list = TodoList.new
            task = Todo.new("Wash the car!")
            todo_list.add_phone_call_tasks(phone_numbers)
            todo_list.add(task.task)
            expect(todo_list.list_of_tasks).to eq ["Call - 07955117614", "Call - 07965870126", "Wash the car!"]
        end
    end
end

