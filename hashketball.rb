require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5 
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  points = nil
  game_hash.each do |team, team_data|
    team_data.each do |category, specific|
      if category == :players
        team_data[category].each do |player, stats|
          if player == name
            specific[player].each do |stat, value|
              if stat == :points
                points = value
              end
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(name)
  shoe_size = nil
  game_hash.each do |team, data|
    data.each do |data_type, data_spec|
      if data_type == :players
        data[data_type].each do |player, stat|
          data[data_type][player].each do |stat, val|
            if player == name && stat == :shoe
              shoe_size = val
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(input_team)
  team_colors = nil
  game_hash.each do |team, data|
    data.each do |aspect, attribute|
      if aspect == :team_name && data[:team_name] == input_team
        team_colors = data[:colors]
      end
    end
  end
  team_colors
end

def team_names
  names = []
  game_hash.each do |status, data_type|
    data_type.each do |aspect, data|
      if aspect == :team_name
        names << data
      end
    end
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |status, data|
    data.each do |type, specific|
        if data[:team_name] == team
          data[:players].each do |player, stats|
            stats.each do |stat, val|
              if stat == :number
                numbers << val
              end
            end
          end
        end
    end
  end
  numbers.uniq
end

def player_stats(input_player)
  game_hash.each do |team_status, team_data|
    team_data.each do |datatype, data|
      if datatype == :players
        team_data[:players].each do |player, stats|
          if player == input_player
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = {}
  game_hash.each do |team_status, team_data|
    team_data.each do |datatype, data|
      if datatype == :players
        data.each do |player, stats|
          shoe_sizes[player] = stats[:shoe]
        end
      end
    end
  end
  biggest = shoe_sizes.max_by{|player, shoe| shoe}[0]
  rebounds = nil
    game_hash.each do |team_status, team_data|
    team_data.each do |datatype, data|
      if datatype == :players
        data.each do |player, stats|
          if player == biggest
            rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end