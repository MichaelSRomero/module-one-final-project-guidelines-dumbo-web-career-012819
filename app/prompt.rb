require "pry"
def prompt
  TTY::Prompt.new(active_color: :cyan)
end

def load_logo_ascii
  puts "
    ██████╗  ██████╗ ██╗  ██╗███████╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝████╗ ████║██╔═══██╗████╗  ██║
    ██████╔╝██║   ██║█████╔╝ █████╗  ██╔████╔██║██║   ██║██╔██╗ ██║
    ██╔═══╝ ██║   ██║██╔═██╗ ██╔══╝  ██║╚██╔╝██║██║   ██║██║╚██╗██║
    ██║     ╚██████╔╝██║  ██╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                          - TOM VERSION -

                                            * James Kang
                                            * Michael Romero




  "
end

def print_opp(opponent)
  i = 0
  while i <= opponent.length
    if opponent[i] == nil
      break
    elsif opponent[i + 1] == nil
      puts "             ⊝ #{opponent[i].ljust(15)}"
    else
      puts "             ⊝ #{opponent[i].ljust(15)}      ⊝ #{opponent[i + 1]}"
    end
    i += 2
  end
end

def load_scoreboard(opponent)
  puts"
    ██╗    ██████╗ ██╗  ██╗███╗   ███╗███╗   ██╗    ██╗
   ██╔╝    ██╔══██╗██║ ██╔╝████╗ ████║████╗  ██║    ╚██╗
  ██╔╝     ██████╔╝█████╔╝ ██╔████╔██║██╔██╗ ██║     ╚██╗
  ╚██╗     ██╔═══╝ ██╔═██╗ ██║╚██╔╝██║██║╚██╗██║     ██╔╝
   ╚██╗    ██║     ██║  ██╗██║ ╚═╝ ██║██║ ╚████║    ██╔╝
    ╚═╝    ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═══╝    ╚═╝

      ██╗    ██╗     ███████╗███████╗████████╗    ██╗
     ██╔╝    ██║     ██╔════╝██╔════╝╚══██╔══╝    ╚██╗
    ██╔╝     ██║     █████╗  █████╗     ██║        ╚██╗
    ╚██╗     ██║     ██╔══╝  ██╔══╝     ██║        ██╔╝
     ╚██╗    ███████╗███████╗██║        ██║       ██╔╝
      ╚═╝    ╚══════╝╚══════╝╚═╝        ╚═╝       ╚═╝

  "
  print_opp(opponent)
  puts "
     █████╗█████╗█████╗█████╗█████╗█████╗█████╗█████╗
     ╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝╚════╝
  "
end

def load_menu_ascii
  puts"
    ███╗   ███╗███████╗███╗   ██╗██╗   ██╗
    ████╗ ████║██╔════╝████╗  ██║██║   ██║
    ██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║
    ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║
    ██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝
    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝

  "
end
