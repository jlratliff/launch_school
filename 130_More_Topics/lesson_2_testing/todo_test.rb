require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require 'simplecov'
SimpleCov.start

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_select
    new_list = @list.select { |todo| }
  end

  # def test_each
  #   assert_equal(@list, @list.each {|todo| nil })
  # end

  # def test_each
  #   @list.each { |todo| todo.done!}
  #   assert_equal(@list.done?, true)
  # end

  # def test_to_s
  #   output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  #   ---- Today's Todos ----
  #   [ ] Buy milk
  #   [ ] Clean room
  #   [ ] Go to gym
  #   OUTPUT

  #   assert_equal(output, @list.to_s)
  # end

  # def test_remove_at
  #   assert_raises(IndexError) { @list.remove_at(3)}
  #   @list.remove_at(2)
  #   assert_equal([@todo1, @todo2], @list.to_a)
  # end

  # def test_mark_undone_at
  #   @list.mark_all_done
  #   @list.mark_undone_at(0)
  #   assert_equal(@todo1.done?, false)
  #   assert_equal(@todos[0].done?, false )
  # end

  # def test_mark_done_at
  #   @list.mark_done_at(0)
  #   assert_equal(@todo1.done?, @todos[0].done? )
  # end

  # def test_item_at
  #   assert_equal(@list.item_at(1), @todo2)
  #   assert_raises(IndexError) { @list.item_at(3)}
  # end

  # def test_add
  #   @todo4 = Todo.new("Add item")
  #   @list << @todo4
  #   assert_equal(@list.last, @todo4)
  # end
  # def TypeError
  #   assert_raises(TypeError) { @list.add('hello')}
  # end

  # def test_done?
  #   assert_equal(@list.done?, false)
  #   @list.mark_all_done
  #   assert_equal(@list.done?, true)
  # end

  # def test_pop
  #   todo = @list.pop
  #   assert_equal(@todo3, todo)
  #   assert_equal([@todo1, @todo2], @list.to_a)
  # end

  # def test_shift
  #   temp_todo = @list.shift
  #   assert_equal(@todo1, temp_todo)
  #   assert_equal([@todo2, @todo3], @list.to_a)
  # end

  # def test_last
  #   assert_equal(@todo3, @list.last)
  # end

  # def test_first
  #   assert_equal(@todo1, @list.first)
  # end

  # def test_size
  #   assert_equal(3, @list.size)
  # end

  # def test_to_a
  #   assert_equal(@todos, @list.to_a)
  # end

end