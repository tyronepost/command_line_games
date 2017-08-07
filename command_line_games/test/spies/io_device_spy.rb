
class IODeviceSpy
  attr_reader :called, :count, :message, :messages
  def initialize
    @called = false;
    @count = 0;
    @messages = []
  end

  def puts(message)
    @called = true
    @count += 1
    @messages << message
    @message = message
  end

  def print(message)
    @messages << message
    @message = message
  end

  def input=(arr)
    @arr = arr
    @index = 0
  end

  def get_integer

  end

  def get_string
    ret = @arr[@index]
    @index += 1
    ret
  end

  def gets
    ret = @arr[@index]
    @index += 1
    ret
  end
end