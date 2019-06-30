def game_hash
    hash = {
      home: {
        team_name: "Brooklyn Nets",
        colors:["Black", "White"],
        players: {
          "Alan Anderson" => {
            :number=> 0,
            :shoe=> 16,
            :points=> 22,
            :rebounds=> 12,
            :assists=> 12,
            :steals=> 3,
            :blocks=> 1,
            :slam_dunks=> 1
          },
          "Reggie Evans" => {
            :number=> 30,
            :shoe=> 14,
            :points=> 12,
            :rebounds=> 12,
            :assists=> 12,
            :steals=> 12,
            :blocks=> 12,
            :slam_dunks=> 7
          },
          "Brook Lopez" => {
            :number=> 11,
            :shoe=> 17,
            :points=> 17,
            :rebounds=> 19,
            :assists=> 10,
            :steals=> 3,
            :blocks=> 1,
            :slam_dunks=> 15
          },
          "Mason Plumlee" => {
            :number=> 1,
            :shoe=> 19,
            :points=> 26,
            :rebounds=> 12,
            :assists=> 6,
            :steals=> 3,
            :blocks=> 8,
            :slam_dunks=> 5
          },
          "Jason Terry" => {
            :number=> 31,
            :shoe=> 15,
            :points=> 19,
            :rebounds=> 2,
            :assists=> 2,
            :steals=> 4,
            :blocks=> 11,
            :slam_dunks=> 1
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
            :points=> 10,
            :rebounds=> 1,
            :assists=> 1,
            :steals=> 2,
            :blocks=> 7,
            :slam_dunks=> 2
          },
          "Bismak Biyombo" => {
            :number => 0,
            :shoe=> 16,
            :points=> 12,
            :rebounds=> 4,
            :assists=> 7,
            :steals=> 7,
            :blocks=> 15,
            :slam_dunks=> 10
          },
          "DeSagna Diop" => {
            :number=> 2,
            :shoe=> 14,
            :points=> 24,
            :rebounds=> 12,
            :assists=> 12,
            :steals=> 4,
            :blocks=> 5,
            :slam_dunks=> 5
          },
          "Ben Gordon" => {
            :number=> 8,
            :shoe=> 15,
            :points=> 33,
            :rebounds=> 3,
            :assists=> 2,
            :steals=> 1,
            :blocks=> 1,
            :slam_dunks=> 0
          },
          "Brendan Haywood" => {
            :number=> 33,
            :shoe=> 15,
            :points=> 6,
            :rebounds=> 12,
            :assists=> 12,
            :steals=> 22,
            :blocks=> 5,
            :slam_dunks=> 12
          }
        }
      }
    }
  end
  def num_points_scored (name)
    player_points = nil
    game_hash.each do |home_away,team_info|
      team_info.each do |player_data, data|
        if player_data == :players
          data.each do |player_name, stats|
            if player_name == name
              player_points = stats[:points]
            end
          end
        end
      end
    end
    player_points
  end


def shoe_size (name)
player_shoe = nil
game_hash.each do |home_away,team_info|
  team_info.each do |player_data, data|
    if player_data == :players
      data.each do |player_name, stats|
        if player_name == name
          player_shoe = stats[:shoe]
        end
      end
    end
  end
end
player_shoe
end


def team_colors (name)
team_colors = [] #empty array  to fill with answers
game_hash.each do |home_away,team_info|
    team_info.each do |team_data,team_name|
      if team_name == name
      team_colors = game_hash[home_away][:colors]
        end
      end
    end

team_colors.flatten #removing one of the layers in the array- compressing to one level
end

def team_names
  team_array=[]
  game_hash.each do |home_away,team|
    team.each do |team_data, data|
      if team_data==:team_name
        team_array.push(data) #two teams , running again. push adds to, doesnt override
      end
    end
  end
  team_array
end

  def player_numbers(team)
    team_jersey=[]
    if game_hash[:home][:team_name]== team #at second level to see team, if team name is = then continue
      game_hash[:home][:players].each do |player_name,stats| #look through stats, if stat is equal to number then i want it.
      stats.each do |stats_key,stat|
        if stats_key == :number
                  team_jersey.push(stat)
                end
              end
            end
    else game_hash[:away][:team_name]== team #at second level to see team, if team name is = then continue
        game_hash[:away][:players].each do |player_name,stats| #look through stats, if stat is equal to number then i want it.
        stats.each do |stats_key,stat|
          if stats_key == :number
                    team_jersey.push(stat)
                  end
                end
              end
            end
    team_jersey
      end


    def player_stats (name)
      player_data = nil
      game_hash.each do |home_away,team_info|
        team_info.each do |player, data|
          if player == :players
            data.each do |player_name, stats|
              if player_name == name
                player_data=stats
              end
            end
          end
        end
      end
      player_data
      end

      def big_shoe_rebounds
        biggest = 0
        rebounds = 0
        game_hash.each do |home_away, keys|
          keys[:players].each do |player, stats| #
            size=stats[:shoe] #get shoe, if shoe is bigger than 0, rewrite to make biggest then makes it equal to rebounds, then goes to next.
              if size>biggest # move on to next player with biggest shoe size
                biggest=size
                rebounds=stats[:rebounds]
              end
            end
          end
          rebounds
        end
