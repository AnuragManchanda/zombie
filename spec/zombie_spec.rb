# frozen_string_literal: true

# spec/zombie_spec.rb
require 'spec_helper'
require 'zombie_apocalypse'

RSpec.describe ZombieApocalypse do
  context '#begin' do
    context 'when zombie does not infect anyone' do
      it 'should return expected output' do
        zombie_apocalypse = described_class.new(4, [3, 1], [[0, 1], [1, 2], [1, 1]], 'RDRU')
        zombie_apocalypse.begin
        expect(zombie_apocalypse.show_current_positions).to eq "Zombie positions: [[3, 3]] \nCreature positions: [[0, 1], [1, 1], [1, 2]]"
      end
    end

    context 'when zombie move through edge' do
      it 'should return expected output' do
        zombie_apocalypse = described_class.new(4, [3, 1], [[0, 1], [1, 2], [1, 1]], 'RDRU')
        zombie_apocalypse.begin
        expect(zombie_apocalypse.show_current_positions).to eq "Zombie positions: [[3, 3]] \nCreature positions: [[0, 1], [1, 1], [1, 2]]"
      end
    end

    context 'when zombie infect creatures' do
      it 'should return expected output' do
        zombie_apocalypse = described_class.new(4, [3, 1], [[0, 1], [1, 2], [1, 1]], 'D')
        zombie_apocalypse.begin
        expect(zombie_apocalypse.show_current_positions).to eq "Zombie positions: [[0, 1], [1, 1], [2, 1]] \nCreature positions: [[1, 2]]"
      end
    end

    context 'when no creature is left' do
      it 'should return expected output' do
        zombie_apocalypse = described_class.new(4, [3, 1], [[0, 1], [1, 2], [1, 1]], 'DDR')
        zombie_apocalypse.begin
        expect(zombie_apocalypse.show_current_positions).to eq "Zombie positions: [[0, 1], [1, 1], [1, 2], [3, 1]] \nCreature positions: []"
      end
    end
  end
end
