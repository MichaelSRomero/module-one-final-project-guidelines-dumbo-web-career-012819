# Loops through animation directory, printing out each file
def load_battle_animation
  i = 0

  while i <= 20
    print "\033[2J"

    File.foreach("animation/0#{i}-battle.rb") { |f| puts f }
    sleep(0.15)
    i += 1
  end
end
