require 'pry'

# Build game_hash method
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee"=> {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry"=> {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {

        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" =>  {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },

        "DeSagna Diop"=> {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" =>  {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
#
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end


# Build a method, `num_points_scored` that takes in an argument of a player's name and returns the number of points scored for that player.
def num_points_scored(player_name)

  if game_hash.dig(:home, :players, player_name, :points) == nil
    game_hash.dig(:away, :players, player_name, :points)
  else
    game_hash.dig(:home, :players, player_name, :points)
  end

end



def num_points_scored(player_name)
  game_hash.each do |location, team_data|

    team_data[:players].each do |player, player_stats|
      binding.pry
      if player == player_name
        return player_stats[:points]
      end
    end
  end
end

# def num_points_scored(name)
#   player = find_the_player(name)
#   player.fetch(:points)
# end



# * Build a method, `shoe_size`, that takes in an argument of a player's name and returns the shoe size for that player.
def shoe_size(player_name)

  if game_hash.dig(:home, :players, player_name, :shoe) == nil
    game_hash.dig(:away, :players, player_name, :shoe)
  else
    game_hash.dig(:home, :players, player_name, :shoe)
  end

end

# Build a method, `team_colors`, that takes in an argument of the team name and returns an array of that teams colors.
def team_colors(team_name)
  game_hash.each_key do |key|
    if game_hash[key][:team_name] == team_name
      return game_hash[key][:colors]
      # binding.pry
    end
  end
end

# * Build a method, `team_names`, that operates on the game hash to return an array of the team names.
def team_names
  team_names = []
  game_hash.each_key do |key|
  team_names.push(game_hash[key][:team_name])
  end
  return team_names
end


# * Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.

def player_numbers(team_name)

  player_numbers = []

  game_hash.each_key do |key|

    if game_hash[key][:team_name] == team_name

      players_data = game_hash[key][:players]

      players_data.each_key do |player_name|
        number = players_data[player_name][:number]
        player_numbers.push(number)
      end

    end

  end

  player_numbers.sort

end

# * Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.
def player_stats(player_name)

    if game_hash[:home][:players][player_name] == nil

    game_hash[:away][:players][player_name]

    else
    game_hash[:home][:players][player_name]

    end

end


# * Build a method, `big_shoe_rebounds`, that will return the number of rebounds associated with the player that has the largest shoe size.

def big_shoe_rebounds

  # create a new hash with only the playername and player stats
  players_hash = game_hash[:home][:players].merge (game_hash[:away][:players])

  # find the player with the largest shoe size
  big_shoe_player = players_hash.max_by {|(k, v)| v[:shoe]}

  # will have player_name at this point, Note the output is an array!!!

  #Then, return that player's number of rebounds

    big_shoe_rebounds = big_shoe_player[1][:rebounds]

end

  # Good references: difference between max and max_by
  # https://gist.github.com/jnst/2205a3ef4d92701a7bceef215b70e1cc

  # helper methods:

  def teams
    game_hash.values
  end

  def players
    game_hash[:home][:players].merge(game_hash[:away][:players])
  end

  def find_the_team(team_name)
    teams.find {|team| team.fetch(:team_name) == team_name}
  end

  def find_the_player(name)
    players.fetch(name)
  end
  # 1. Which player has the most points? Call the method `most_points_scored`.

  def most_points_scored
    players.max_by {|(k, v)| v[:points]}
  end
  # 2. Which team has the most points? Call the method `winning_team`.
  #
  # 3. Which player has the longest name? Call the method `player_with_longest_name`.
  #
  # 1. Write a method that returns true if the player with the longest name had the most steals. Call the method `long_name_steals_a_ton?`.
