class Queue
  def initialize()
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue(el)
    @queue.unshift
  end

  def peek
    @queue[0]
  end


end
