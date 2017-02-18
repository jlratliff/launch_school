require "pry"

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo ojects' unless todo.instance_of? Todo

    @todos << todo
  end

  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  # def to_s
  #   puts "---- Today's Todos ----"
  #   @todos.each { |item| puts item}

  # end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    result = TodoList.new(title)
    each do |todo|
      result.add(todo) if yield todo
    end

    result
  end

  def find_by_title(title)
    @todos.detect { |todo| todo.title == title} 
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done}
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done!}
  end

  def mark_all_undone
    each { |todo| todo.undone!}
  end

end



