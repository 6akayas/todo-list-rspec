require "rspec"

require_relative "list"
require_relative "task"

describe List do

  let(:title) { "Chores" }
  let(:task)  { Task.new("Mop") }
  let(:tasks) { [task, Task.new("Sweep"), Task.new("Clean")] }

  let(:list)  { List.new(title, tasks) }

  describe "#initialize" do
    it "takes two arguments" do
      expect(List.new(title, tasks)).to be_a_kind_of(List)
    end

    it "requires two argument" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#title" do
    it "returns the correct title for the task" do
      expect(list.title).to eq title
    end
  end

  describe "#add_task" do
    before(:each) do
      list.add_task(tasks)
    end

    it "add tasks to tasks array" do
      expect(list.tasks).to include(tasks)
    end

    describe "#complete_task" do
          it "check if tasks[index] is valid(not nil)" do
              expect(list.tasks[0]).to eq(task)
          end

          it "returns false if the index is nil" do
              expect(list.tasks[0]).nil?
          end

          it "returns true if the task in the array is completed" do
              expect(list.complete_task(0)).to be(true)
          end
      end
    end

    describe "#delete_task" do
      it "deletes task[index]" do
        expect(list.tasks[0]).to eq(tasks[0])
      end

      it "returns true if index is nil" do
        expect(list.delete_task(0)).nil?
    end
  end

  describe "#completed_tasks" do
        it "show list of completed tasks from task array" do
            list.tasks[0].complete!
            list.tasks[1].complete!
            expect(list.completed_tasks).to eq([list.tasks[0],list.tasks[1]])
        end
    end

    describe "#incomplete_tasks" do
        it "shows list of incomplete tasks from task_array" do
            list.tasks[0].complete!
            list.tasks[1].complete!
            expect(list.incomplete_tasks).to eq([list.tasks[2]])
        end
    end
end
