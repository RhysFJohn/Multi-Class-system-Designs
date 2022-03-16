require 'task'
require 'task_list'

RSpec.describe 'tasks integration' do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end
end