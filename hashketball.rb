require "pry"


def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}
end



# def num_points_scored(name)
#   game_hash.each do |teamName, teamDetails|
#     teamDetails[:players].each do |stats, val|
#       if stats == name
#         return game_hash[teamDetails][:players][:points]
#       end
#     end
#   end
# end  
def num_points_scored (name)
  pointsScored = 0
  game_hash.each do |team, teamDetails|
    playerStats = teamDetails[:players]
      playerStats.each do |indvidStats|
        if indvidStats[:name] == name
          pointsScored = indvidStats[:points]
        end
      end
  end
  pointsScored
end
  
  def shoe_size(name)
  size = 0
  game_hash.each do |team, teamDetails|
    playerStats = teamDetails[:players]
      playerStats.each do |indvidStats|
        if indvidStats[:name] == name
          size = indvidStats[:shoe]
        end
      end
  end
  size
end

def team_colors(teamName)
  color=nil
  game_hash.each do |team, teamDetails|
    if teamDetails[:team_name] == teamName
      color = teamDetails[:colors].flatten
    end
  end
    color
end

def team_names
  teams=[]
  game_hash.each do |team, teamDetails|
     teams << teamDetails[:team_name] 
   end
   teams
end

def player_numbers(teamName)
  numbers=[]
  game_hash.each do |team, teamDetails|
    if teamDetails[:team_name] == teamName
      playerStats = teamDetails[:players]
      playerStats.each do |indvidStats|
        numbers << indvidStats[:number]
      end
    end
  end
  numbers
end

def player_stats(playerName)
  pStats= {}
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
     if indvidStats[:name] == playerName
       indvidStats.delete(:name)
       pStats= indvidStats
     end
   end
 end
 pStats
end

def big_shoe_rebounds
  shoe=0 
  rebound=0
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:shoe] > shoe 
        shoe= indvidStats[:shoe]
        rebound = indvidStats[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  pName=nil
  pScore=0 
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:points] > pScore
        pScore= indvidStats[:points]
        pName= indvidStats[:name]
      end
    end
  end
  pName
end

def winning_team
  winner={}
  game_hash.values.each do |teamDetails|
    teamPoints=0 
    teamDetails[:players]. each do |indvidStats|
      teamPoints += indvidStats[:points]
    end
    winner[teamDetails[:team_name]]= teamPoints
  end
  winner.key(winner.values.max)
end


def player_with_longest_name
  nameSize=0 
  pName= nil
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:name].length > nameSize
        nameSize = indvidStats[:name].length
        pName= indvidStats[:name]
      end
    end
  end
  pName
end

def long_name_steals_a_ton?
  pName=nil
  pSteals=0 
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:steals] > pSteals
        pSteals = indvidStats[:steals]
        pName= indvidStats[:name]
      end
    end
  end
  if pName == player_with_longest_name
    return true
  else
    return false 
  end
end
