# Problem Description

After the nuclear war, a strange and deadly virus has infected the planet producing mindless zombies. These zombies now wander the world converting any remaining living creatures they find to zombies as well.

The world is represented by an n x n grid on which zombies and creatures live. The location of zombies and creatures can be addressed using zero-indexed x-y coordinates. The top left corner of the world is (x: 0, y: 0). The horizontal coordinate is represented by x, and the vertical coordinate is represented by y.

At the beginning of the program, a single zombie awakes and begins to move around the grid following a sequence of movements. Valid movements are Up, Down, Left, Right. The movement sequence is represented by a string of single character movements, e.g. RDRU (Right, Down, Right, Up).

Zombies can move through the edge of the grid, appearing on the directly opposite side. For a 10x10 grid, a zombie moving left from (0, 4) will move to (9, 4); a zombie moving down from (3, 9) will move to (3, 0).

Each time a zombie takes a step, the new location should be logged, eg: zombie 0 moved to (2,3).

If a zombie occupies the same square as a creature, the creature is transformed into another zombie.

Each time a zombie infects a creature this should be logged, eg:

zombie 0 infected creature at (3,3)

The creatures are aware of the zombie’s presence but are so frightened that they never move.

Once a zombie has completed its movement, the first newly created zombie moves using the same sequence as the original zombie, then the second newly created zombie moves, and so on, in order of infection. Each zombie performs the same sequence of moves. Once all zombies have completed moving, the final positions of all zombies and creatures should be output, then the program ends.

***input parameters:***
● dimensions of the grid (N),
● the initial position of the zombie,
● a list of initial positions of the creatures ,
● and a list of moves t

# Assumptions
● Docker desktop need to be installed to run docker-compose
● Expecting users to provide input in the correct format, am not handling any validation due to time contraints.

# Usage

**To run test cases**

    docker-compose run zombie_apocalypse bundle install && bundle exec rspec

**To run application with cli**

    docker-compose run zombie_apocalypse ruby lib/main.rb

**Example Input**

    4
    3,1
    0,1|1,2|1,1
    RDRU

**Example output**

    log: Zombie 0 moved to [3, 2]
    log: Zombie 0 moved to [0, 2]
    log: Zombie 0 moved to [0, 3]
    log: Zombie 0 moved to [3, 3]
    Zombie positions: [[3, 3]]
    Creature positions: [[0, 1], [1, 1], [1, 2]]

**Test cases output**

    Fetching gem metadata from https://rubygems.org/.......
    Resolving dependencies...
    Using bundler 2.1.4
    Fetching byebug 11.1.3
    Installing byebug 11.1.3 with native extensions
    Fetching diff-lcs 1.5.0
    Installing diff-lcs 1.5.0
    Fetching rspec-support 3.11.0
    Installing rspec-support 3.11.0
    Fetching rspec-core 3.11.0
    Installing rspec-core 3.11.0
    Fetching rspec-expectations 3.11.0
    Installing rspec-expectations 3.11.0
    Fetching rspec-mocks 3.11.1
    Installing rspec-mocks 3.11.1
    Fetching rspec 3.11.0
    Installing rspec 3.11.0
    Bundle complete! 2 Gemfile dependencies, 8 gems now installed.
    Use `bundle info [gemname]` to see where a bundled gem is installed.
    log: Zombie 0 moved to [3, 2]
    log: Zombie 0 moved to [0, 2]
    log: Zombie 0 moved to [0, 3]
    log: Zombie 0 moved to [3, 3]
    .log: Zombie 0 moved to [3, 2]
    log: Zombie 0 moved to [0, 2]
    log: Zombie 0 moved to [0, 3]
    log: Zombie 0 moved to [3, 3]
    .log: Zombie 0 moved to [0, 1]
    log: Zombie 0 infected creature at [0, 1]
    log: Zombie 1 moved to [1, 1]
    log: Zombie 1 infected creature at [1, 1]
    log: Zombie 2 moved to [2, 1]
    .log: Zombie 0 moved to [0, 1]
    log: Zombie 0 infected creature at [0, 1]
    log: Zombie 0 moved to [1, 1]
    log: Zombie 0 infected creature at [1, 1]
    log: Zombie 0 moved to [1, 2]
    log: Zombie 0 infected creature at [1, 2]
    log: Zombie 1 moved to [2, 2]
    log: Zombie 1 moved to [3, 2]
    log: Zombie 1 moved to [3, 3]
    log: Zombie 2 moved to [0, 3]
    log: Zombie 2 moved to [1, 3]
    log: Zombie 2 moved to [1, 0]
    log: Zombie 3 moved to [2, 0]
    log: Zombie 3 moved to [3, 0]
    log: Zombie 3 moved to [3, 1]
    .

    Finished in 0.00249 seconds (files took 0.04422 seconds to load)
    4 examples, 0 failures
