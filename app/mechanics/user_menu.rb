############################################
## --------- USER MENU METHOD ------------##
############################################

def display_user_menu(user)
  until false
    system "clear"
    load_menu_ascii
    stop_music
    load_user_menu_music

    prompt.select("\n#{user.name.upcase}\'s MENU \n", per_page: 8) do |menu|
      menu.choice "Battle!", -> {battle_setup(user)}
      menu.choice "Trainer Battle!", -> {trainer_setup(user)}
      menu.choice "Battle Record", -> {battle_record(user)}
      menu.choice "My Pokemon", -> {my_pokemon(user)}
      menu.choice "Nickname My Pokemon", -> {nickname_pkmn(user)}
      menu.choice "Change Name", -> {change_name(user)}
      menu.choice "Delete Data", -> {delete_data(user)}
      menu.choice "Exit", -> {exit_menu(user)}
    end
  end
end

############################################
## ----------- MENU CHOICES --------------##
############################################

def delete_data(user)
  system "clear"
  input = prompt.select("Are you sure about deleting your data?") do |menu|
    menu.choice "I'm sure", 1
    menu.choice "Nevermind"
  end
  if input == 1
    User.destroy(user.id)
    puts "Data deleted"
    exit
  else
    puts "Nice save!"
    sleep (1)
    display_user_menu(user)
  end
end

def change_name(user)
  new_name = prompt.ask("Enter your new name:") do |q|
    q.required true
  end

  user.name = new_name
  user.save
end

def nickname_pkmn(user)
  user_pokemons = (UserPkmn.all.where user_id: user.id, captured: true)
  user_choices = user_pokemons.map { |list| list.pkmn.name.capitalize  }
  user_choices << "Exit"
  choice = prompt.select("Pick one of your Pokemon you would like to nickname!", user_choices)

  display_user_menu(user) if choice == "Exit"

  pokemon = user_pokemons.find_by pkmn_id: (Pkmn.all.find_by name: choice.downcase)
  puts "\n"
  new_nickname = prompt.ask("Your #{choice} is currently nicknamed \"#{pokemon.nickname}\". Enter a new nickname:", default: pokemon.nickname)

  UserPkmn.all.update(pokemon.id, nickname: new_nickname)
end

def my_pokemon(user)
  system "clear"
  user_pokemon = UserPkmn.all.where user_id: user.id, captured: true
  puts "  POKEDEX| POKEMON (NICKNAME)"
  puts " ------------------------------"
  puts user_pokemon.map { |row| "  ##{row.pkmn.pokedex.to_s.ljust(3)}     #{row.pkmn.name.capitalize.ljust(11)} (#{row.nickname})" }
  prompt.select("") { |menu| menu.choice "Go back", -> {display_user_menu(user)} }
end

def battle_record(user)
  system "clear"
  user_stat = UserPkmn.all.where user_id: user.id
  puts "  WIN(s)| LOSS| POKEMON"
  puts " ------------------------------"
  puts (user_stat.map{ |row| "  #{row.win}W   #{row.loss}L        #{row.pkmn.name.capitalize}" }).sort
  prompt.select("") { |menu| menu.choice "Go back", -> {display_user_menu(user)} }
end

def exit_menu(user)
  puts "Goodbye Pokemon Master, #{user.name}!"

  stop_music
  exit
end
