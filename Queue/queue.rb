class Queue
  def initialize()
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue(el)
    check_queue
    @queue.unshift
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
