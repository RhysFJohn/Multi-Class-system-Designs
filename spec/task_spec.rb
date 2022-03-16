require 'task'

RSpec.describe Task do
  it "constructs" do
    task = Task.new("Walk the dog")
    expect(task.title).to eq "Walk the dog"
  end
end