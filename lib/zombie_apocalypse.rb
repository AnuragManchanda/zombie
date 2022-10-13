# frozen_string_literal: true

# main zombie class
class ZombieApocalypse
  def initialize(grid_size, zombie_position, creatures_positions, moves)
    @grid = Array.new(grid_size) { Array.new(grid_size, nil) }

    @grid[zombie_position[0]][zombie_position[1]] = 'Z'

    @next_zombie_queue = [zombie_position]

    creatures_positions.each do |creature_position|
      @grid[creature_position[0]][creature_position[1]] = 'C'
    end

    @moves = moves.chars
  end

  def begin
    zombie_count = 0
    while @next_zombie_queue.length.positive?
      current_zombie_pos = @next_zombie_queue.pop
      @moves.each do |move|
        leave(current_zombie_pos)

        case move
        when 'U'
          current_zombie_pos[0] = (current_zombie_pos[0]).zero? ? @grid.length - 1 : current_zombie_pos[0] - 1
          move(zombie_count, current_zombie_pos)
        when 'D'
          current_zombie_pos[0] = current_zombie_pos[0] == @grid.length - 1 ? 0 : current_zombie_pos[0] + 1
          move(zombie_count, current_zombie_pos)
        when 'R'
          current_zombie_pos[1] = current_zombie_pos[1] == @grid.length - 1 ? 0 : current_zombie_pos[1] + 1
          move(zombie_count, current_zombie_pos)
        when 'L'
          current_zombie_pos[1] = (current_zombie_pos[1]).zero? ? @grid.length - 1 : current_zombie_pos[1] - 1
          move(zombie_count, current_zombie_pos)
        end
      end
      zombie_count += 1
    end
  end

  def move(zombie_count, current_zombie_pos)
    puts "log: Zombie #{zombie_count} moved to #{current_zombie_pos}"

    case @grid[current_zombie_pos[0]][current_zombie_pos[1]]
    when 'C'
      @grid[current_zombie_pos[0]][current_zombie_pos[1]] = 'ZC'
      puts "log: Zombie #{zombie_count} infected creature at #{current_zombie_pos}"
      @next_zombie_queue.prepend(current_zombie_pos)
    when 'Z'
      @grid[current_zombie_pos[0]][current_zombie_pos[1]] = 'ZZ'
    when nil
      @grid[current_zombie_pos[0]][current_zombie_pos[1]] = 'Z'
    end
  end

  def leave(current_zombie_pos)
    case @grid[current_zombie_pos[0]][current_zombie_pos[1]]
    when 'ZC' || 'ZZ'
      @grid[current_zombie_pos[0]][current_zombie_pos[1]] = 'Z'
    when 'Z'
      @grid[current_zombie_pos[0]][current_zombie_pos[1]] = nil
    end
  end

  def show_current_positions
    zombie_positions = []
    creature_positions = []

    @grid.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        if column == 'C'
          creature_positions << [row_index, column_index]
        elsif !column.nil?
          zombie_positions << [row_index, column_index] if column == 'Z'
        end
      end
    end

    "Zombie positions: #{zombie_positions} \nCreature positions: #{creature_positions}"
  end
end
