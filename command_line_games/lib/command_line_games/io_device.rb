require 'logger'

class IODevice
  def initialize
    log_directory = "log"
    Dir.mkdir(log_directory) unless File.exist?(log_directory)
    @logger = Logger.new("#{log_directory}/games.log")
  end

  def get_integer
    Kernel.gets.chomp.to_i
  end

  def get_string
    Kernel.gets.chomp.upcase
  end

  def gets
    Kernel.gets
  end

  def puts(message)
    Kernel.puts message
    logger.info(message)
  end

  def print(message)
    Kernel.print message
    logger.info(message)
  end

  private
  attr_reader :logger
end