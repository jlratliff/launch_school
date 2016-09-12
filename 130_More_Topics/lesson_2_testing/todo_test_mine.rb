require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

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

def test_to_s
  output = <<-OUTPUT.chomp.gsub /^\s+/, ""
  ---- Today's Todos ----
  [ ] Buy milk
  [ ] Clean room
  [ ] Go to gym
  OUTPUT

  assert_equal(output, @list.to_s)
end

  def test_item_at
    skip
    assert_raises(IndexError) { @list.item_at(50)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_add_alias
    skip
    assert_equal( @list.add(@todo1), @list << @todo1)
  end

  def test_type_error_add
    skip
    assert_raises(TypeError) { @list.add("x") }
    assert_raises(TypeError) { @list.add(20)}

  end

  def test_done?
    skip
    assert_equal(@list.done?, false)
  end

  def test_pop
    skip
    popper = @list.pop
    assert_equal(popper, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)

  end

  def test_shift
    skip
    shifter = @list.shift
    assert_equal(shifter, @todo1)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_last
    skip
    assert_equal(@list.last, @todo3)
  end

  def test_first
    skip
    assert_equal(@list.first, @todo1)
  end

  def test_size
    skip
    assert_equal(3, @list.size)
  end

  def test_to_a
    skip
    assert_equal(@todos, @list.to_a)
  end

end