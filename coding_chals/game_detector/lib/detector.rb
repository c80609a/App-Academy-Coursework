EDITED_IDS = {
  "CallOfDutyWW2" => ["Call of duty world war two", "COD WW2", "COD WWII", "WW2COD"],
  "Fortnite" => ["Fortnite", "Fort Nite"],
  "Destiny" => ["Destiny", "original Destiny game"],
  "Destiny2" => ["Destiny 2", "last Destiny game", "Destiny II"],
  "WorldOfWarcraft" => ["WoW the game", "world of warcraft"]
}

DOC = [
  "I like the last Destiny game, now I play Fortnite",
  "Lol, no comment about that",
  "I'm still playing world of warcraft since ww2"
]
## each value really needs to be unique as well, otherwise there
## can be no distinction made for the tags
INVERTED_IDS = {}
EDITED_IDS.each {|k, v|
  # v is an array of strings
  v.each { |str| INVERTED_IDS[str] = k }
}



def create_keywords(hash)
  smalls = %w(a an of the last first two game)
  keywords = []
  hash.values.flatten.each do |string|
    keywords << string.split(" ")
  end
  keywords.flatten.reject! {|word| smalls.include?(word)}
end

@keywords = create_keywords(IDS)

def scan_by_line(document)
  result = document.map do |line|
    hash_me = false
    line.split(" ").each do |word|
      hash_me = true if @keywords.include?(word) ## already here at O(n) each word
    end
    if hash_me
      add_tags(line)
    else
      line
    end
  end

  result
end

def add_tags(line)
  words = line.split(" ") # words array
  # start iterating over, any subset may be a phrase match 


end

scan_by_line(DOC)
