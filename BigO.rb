fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
def sluggish_oct(fish) #bubble sort
  fish = fish.clone
  sorted = false
  while !sorted
    sorted = true
    (0...fish.length ).each do |i|
      (i + 1...fish.length ).each do |j|
        if fish[i].length > fish[j].length
          fish[i] , fish[j] = fish[j] , fish[i]
          sorted = false
        end
      end
    end
  end
  return fish[-1]
end
# Dominant Octopus
def dominant_oct(fish) #quick sort
  return fish if fish.length < 2
  pivot = fish[0]
  left = fish[1..-1].select{ |el| el.length < pivot.length }
  right = fish[1..-1].select{ |el| el.length > pivot.length }
  dominant_oct(left) + [pivot] + dominant_oct(right)
  
end

def last_indx(fish)
  dominant_oct(fish).last
end

# Clever Octopus
def clever_oct(fish)
  fish[-1]
end

#Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
direction = "up"
def slow_dance(direction , titles_array)
  titles_array.each_with_index do |el,i|
    return i if el == direction
  end
end

#Constant Dance
tile_hash = {"up" => 0 , "right-up" => 1, "right" => 2 , "right-dow=>n" => 3 , "down" => 4 , "left-down" => 5, "left" => 6,  "left-up" => 7}
direction = "up"
def fast_dance(direction, tile_hash)
  return tile_hash[direction]
end
p sluggish_oct(fish)  == "fiiiissshhhhhh"
p last_indx(fish)  == "fiiiissshhhhhh"
p clever_oct(fish)  == "fiiiissshhhhhh"
p slow_dance("up", tiles_array) == 0
p fast_dance("up", tile_hash) == 0