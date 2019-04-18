# Write your code here!
require 'pry'

def game_hash
  game_hash = {
  :home =>  {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
        "Alan Anderson" => {
        number: 0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks: 1 
    },
      "Reggie Evans"=>{
      number: 30,
      shoe:14,
      points:12,
      rebounds:12,
      assists:12,
      steals:12,
      blocks:12,
      slam_dunks: 7 
    },
      "Brook Lopez" => {
        number: 11,
        shoe:17,
        points:17,
        rebounds:1219,
        assists:10,
        steals:3,
        blocks:1,
        slam_dunks: 15
    },
      "Mason Plumlee" => {
      number: 1,
      shoe:19,
      points:26,
      rebounds:12,
      assists:6,
      steals:3,
      blocks:8,
      slam_dunks: 5 
    },
      "Jason Terry"=> {
        number: 31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks: 1 
    }
    }
  },
  :away =>
  {
    team_name: "Charlotte Hornets",
    colors: [" Turquoise", "Purple"],
    players:
    {
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
      "Bismak Biyombo" => {
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
      "Brendan Haywood"=> {
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

def num_points_scored(player) 
  game_hash.each do |location, details|
    details.each do |detail, value|
      if detail == :players
        value.each do |person, data|
          # binding.pry
          if person == player
           data.each do |id, stats|
            if id == :points
            return stats
            # binding.pry
            end
          end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, details|
    details.each do |detail, value|
      if detail == :players
        value.each do |person, data|
          # binding.pry
          if person == player
           data.each do |id, stats|
            if id == :shoe
            return stats
            # binding.pry
            end
          end
          end
        end
      end
    end
  end
end

# def team_colors(team)
#   team = find_the_team(team)
#   puts team
#   #.fetch
#   game_hash.each do |location, details|
#     details.each do |detail, value|
#       # binding.pry
#       if detail == :team_name
#         detail.keys
      
#       end
#     end
#   end
  
# end
def team_colors(team)
  names = []
  game_hash.select do |location, details|
    details.each do |detail, value|
    if   detail == team
        binding.pry
        # if  key==:colors
        names << details[:colors]
        
      end
    end
    
  end
    names
    # binding.pry

end

# def team_names
#   names = []
#   game_hash.each do |location, details|
#     details.each do |detail, value|
      
#       if detail == :team_name
#         names << value
#       end
#     end
#   end
#     names
#     # binding.pry

# end


# def player_numbers(team)
#   answer = []
#   game_hash.each do |location, details|
#     details.each do |detail, value|
#       if detail == :players
#         value.each do |person, data|
#           # if data== team
#           data.each do |id, stats|
#             if id == :number
#             answer << stats
#             # binding.pry
#             end
          
#           end
#           end
          
#         end
        
#       end
#     end
#     answer
#   end
# # answer
# end

#----------------------------------------Questions below
#   game_hash[:home_team][:players].each do |current_player|
#     if current_player[:name]== player
#     current_player[:points]
#     end
#   end
# end

# def num_points_scored(name) #returning the full away hash. How do I convert hash to array with .flatten
#   game_hash.each do |location, team_data|
#       team_data[:players].each do |player_name, data|
#         if player_name == name #check the name to match
#             data[:points]
#         end
#       end
#   end
# end


#num_points_scored("Brendan Haywood") 
# def num_points_scored(player_name, game_hash)
#   home = game_hash[:home].flatten
#   away = game_hash[:away].flatten
#     binding.pry
#   game_hash.each {|team, points| team[player_name].include?(player) ? 
#     game_hash[:player_name][:points] : " "
#   }

# end

 
# def num_points_scored(player_name)
#   total_points = nil
#     game_hash.each do |team, details_hash|
#       player_details = details_hash[:players]
#       player_details.each do |player, points|
#         if player == player_name
#           total_points = player_details[:points]
#           return total_points
#         end
        
#       end
# end
#   # game_hash[:player_name].fetch(:points)
# end



