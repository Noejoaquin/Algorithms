require "minitest/autorun"


class MyQueue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
    @queue
  end

  def dequeue
    check_queue
    @queue.shift
    @queue
  end

  def peek
    check_queue
    @queue[0]
  end

  private

  def check_queue
    if @queue.empty?
      raise('queue is empty')
    end
  end
end

class TestQueue < Minitest::Test
  def test_enqueue
    q = MyQueue.new
    assert_equal [4], q.enqueue(4)
  end

  def test_dequeue
    q = MyQueue.new
    q.enqueue(4)
    q.enqueue(6)
    assert_equal [6], q.dequeue
  end

  def test_peek
    q = MyQueue.new
    q.enqueue(4)
    assert_equal 4, q.peek
  end

end
