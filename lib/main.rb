# frozen_string_literal: true

require_relative 'zombie_apocalypse'

# Input for zombie apocalypse
class ConsoleInput
  def initialize
    puts 'Enter Grid size'
    @grid_size = gets.chomp.to_i

    puts 'Enter initial zombie position in row,column format'
    @zombie_position = gets.chomp.split(',').map(&:to_i)

    puts 'Enter initial creature positions in row,column|row,column|row,column format'
    @creatures_positions = gets.chomp.split('|').map { |pos| pos.split(',').map(&:to_i) }

    puts 'Enter moves'
    @moves = gets.chomp
  end

  def process
    zombie_apocalypse = ZombieApocalypse.new(@grid_size, @zombie_position, @creatures_positions, @moves)
    zombie_apocalypse.begin
    zombie_apocalypse.show_current_positions
  end
end

puts ConsoleInput.new.process
