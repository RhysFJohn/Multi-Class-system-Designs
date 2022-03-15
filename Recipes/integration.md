# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my pasy diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby
  class Diary
    def add(entry) # entry is an instance of DiaryEntry
    end

    def entries
      # Returns a list of DiaryEntries
    end
  end

  class DiaryEntry
    def initialize(title, contents) # title, contents are both strings
    end

    def title
      # Returns title as a string
    end

    def contents
      # Returns contents as a string
    end
  end

  class PhoneNumberCrawler
    def initialize(diary) # diary is an instance of Diary
    end

    def extract_numbers
      # Returns a list of strings representing phone numbers
      # gathered across all diary entries
    end
  end

  class DiaryReader
    def initialize(wpm, diary)
      # - wpm is a number representing how many words the reader can read 
      #   in one minute
      # - diary is an instance of Diary
    end

    def find_most_readable_in_time(time)
      # Returns an instance of DiaryEntry, corresponding to the entry with
      # the longest contents that is still readable within the time, based on
      # the wpm specified earlier.
    end
  end

  class TaskList
    def add(task) # task is an instance of task

    end

    def all
      # Returns a list of tasks
    end
  end

  class Task
    def initalize(title) # title is a string

    end

    def title 
       # Returns the title as a string
    end
  end
```

## 3. Create Examples as Integration tests

_Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used._

```ruby
  # > As a user
  # > So that I can record my experiences
  # > I want to keep a regular diary

  # > As a user
  # > So that I can reflect on my experiences
  # > I want to read my past diary entries

  #  1
  diary = Diary.new
  entry_1 = DiaryEntry.new("my title", "my contents")
  entry_2 = DiaryEntry.new("my title two", "my contents two")
  diary.add(entry_1)
  diary.add(entry_2)
  expect(diary.entries).to eq [entry_1, entry_2]


  # > As a user
  # > So that I can reflect on my experiences in my busy day
  # > I want to select diary entries to read based on how much time I have and my reading speed

  # 2 - fits exactly
  diary = Diary.new
  reader = DiaryReader.new(2, diary)
  entry_1 = DiaryEntry.new("title1", "one")
  entry_2 = DiaryEntry.new("title2", "one two")
  entry_3 = DiaryEntry.new("title3", "one two three")
  entry_4 = DiaryEntry.new("title4", "one two three four")
  entry_5 = DiaryEntry.new("title5", "one two three four five")
  diary.add(entry_1)
  diary.add(entry_2)
  diary.add(entry_3)
  diary.add(entry_4)
  diary.add(entry_5)
  expect(reader.find_most_readable_in_time(2)).to eq entry_4
  
  # 3 - does not fit exactly
  diary = Diary.new
  reader = DiaryReader.new(2, diary)
  entry_1 = DiaryEntry.new("title1", "one")
  entry_2 = DiaryEntry.new("title2", "one two")
  entry_3 = DiaryEntry.new("title3", "one two three")
  entry_4 = DiaryEntry.new("title5", "one two three four five")
  diary.add(entry_1)
  diary.add(entry_2)
  diary.add(entry_3)
  diary.add(entry_4)
  expect(reader.find_most_readable_in_time(2)).to eq entry_3

  # 4 - Nothing readable in the time
  diary = Diary.new
  reader = DiaryReader.new(2, diary)
  entry_1 = DiaryEntry.new("title5", "one two three four five")
  diary.add(entry_1)
  expect(reader.find_most_readable_in_time(2)).to eq nil
  
  # 5 - Nothing at all 
  diary = Diary.new
  reader = DiaryReader.new(2, diary)
  entry_1 = DiaryEntry.new("title5", "one two three four five")
  diary.add(entry_1)
  expect(reader.find_most_readable_in_time(2)).to eq nil
  
  # 6 - wpm invalid 
  diary = Diary.new
  DiaryReader.new(0, diary) # should fail with "WPM must be above 0."

  # > As a user
  # > So that I can keep track of my tasks
  # > I want to keep a todo list along with my diary

  # 7 
  task_list = TaskList.new
  task_1 = Task.new("Walk the dog")
  task_2 = Task.new("Walk the cat")
  task_list.add(task_1)
  task_list.add(task_2)
  expect(task_list).to eq [task_1, task_2]

  # > As a user
  # > So that I can keep track of my contacts
  # > I want to see a list of all of the mobile phone numbers in all my diary entries

  # 8
  diary = Diary.new
  phone_book = PhoneNumberCrawler.new(diary)
  diary.add(DiaryEntry.new("my title", "my friend 07800000000 is cool"))
  diary.add(DiaryEntry.new("my title", "my friend 07800000000, 07800000001 and 07800000002, 07800000002 and is cool"))
  expect(phone_book.extract_numbers).to eq ["07800000000", "07800000001", "07800000002"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail._

```ruby
# Do these as we go along
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write follow the test-driving process of red, green, refactor to implement the beahaviour._