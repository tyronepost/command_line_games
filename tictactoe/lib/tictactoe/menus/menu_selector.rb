
module MenuSelector
  def menu_select(arr)
    until arr.include? input = @io_device.gets.chomp.to_i
      @io_device.puts "Invalid input."
      @io_device.puts "Select one of the following menu options: #{arr}"
      yield
    end
    input
  end
end