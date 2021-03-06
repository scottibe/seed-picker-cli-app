class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    choose_a_letter
  end

  def choose_a_letter
    puts ""
    puts "^ - ^ Please choose a group of seeds by its letter from A-Z. Type exit to exit." # user is prompted with a demand
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.veggie_seed ## Seeds class veggie_seed method
    puts ""

    # user inputs the letter of the parent seed, that letter gives us a list of all the seeds within that letter starting with an index of 1.
    input = gets.strip.to_s.upcase

    ###
    # main_seeds = SeedPicker::Seeds.find

    ###

    case input
    when ("A"..."Z")
      choose_a_parent_seed
    when "EXIT"
      goodbye
    else
      input = gets.strip.to_s.upcase
    end

  end

  def choose_a_parent_seed
    puts ""
    puts "^ - ^ Please choose a seed by its number. Type back to go back to the list of seeds. Type exit to exit." # user is prompted with a choice
    puts ""
    puts "     ----- Group  -----" # user sees a list of all parent seeds with an index of 1.
    # puts "     1. Amaranth"
    # puts "     2. Artichoke & Cardoon"
    # puts "     3. Asparagus"
    SeedPicker::Seeds.parent_seed
    puts ""

    # user inputs the number corresponding to the parent seed they want to view

    input = gets.strip.to_i || input = gets.strip.to_s.upcase

    case input
    when (1..10)
      choose_list_of_variety
    when "EXIT"
      goodbye
    when "BACK"
      choose_a_letter
    else
      input = gets.strip.to_s.upcase
    end

  end

  def choose_list_of_variety
    puts ""
    puts "^ - ^ Description"
    puts "     -------- A - 1: Amaranth --------"
    puts "     Description of seed"
    puts ""
    puts "     -------- A - 1: Amaranth - Varieties --------" # user sees a list of all parent seeds with an index of 1.
    puts "     1. Aurelia's Verde"
    puts "     2. Dreadlocks Amaranth"
    puts "     3. Elena's Rojo Amaranth"
    puts ""

    # user inputs the number corresponding to the variety they want to view

    input = gets.strip.to_i || input = gets.strip.to_s.upcase

    case input
    when (1..10)
      choose_the_variety
    when "EXIT"
      goodbye
    when "BACK"
      choose_a_parent_seed
    else
      input = gets.strip.to_s.upcase
    end

  end

  def choose_the_variety
    puts "     -------- A - 1: Amaranth - Aurelia's Verde --------" # user sees a list of all parent seeds with an index of 1.
    puts "     Description: "
    puts "     Price: "
    puts "     ---------------------------------------------------"
    puts ""
    puts "~.~ Type back if you want to see another variety of the same seed. Type main-seed if you want to choose another seed. Type done if you are done."
    # user inputs the number corresponding to the variety they want to view

    input = gets.strip.to_s.upcase

    case input
    when "MAIN-SEED"
      choose_a_letter
    when "BACK"
      choose_list_of_variety
    else "DONE"
      goodbye
    end

  end

  def goodbye
    puts "^ - ^ Thank you for viewing our vegetable seed collection. We hope to see you again soon. Have a great day!"
  end

end
