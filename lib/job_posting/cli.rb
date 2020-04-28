class Cli


    def menu
        puts "=================================================="
        puts "What would you like to do?"
        puts "1 - List all jobs."
        puts "2 - Pick a job posting."
        puts "3 - Pick random job"
        puts "Or type MENU for menu, or EXIT to exit the app."
        puts "=================================================="

    end

    def random_job
        puts "=================================================="
        JobObjects.random
        
    end

    def run
        puts "Hello! Welcome to my Kingwood job search app."
        puts "Loading jobs..."
        JobObjects.new.scraper

        menu 


        user_input = nil

        while user_input != "exit"
            user_input = gets.strip.downcase
            if user_input == "1"
                JobObjects::Job.all
                menu
            elsif user_input == "2"
                JobObjects::Job.all
                puts "=================================================="
                puts "Please enter a Position Title:"
                usr_input = gets.strip
                puts "=================================================="
                JobObjects::Job.search(usr_input)
                puts "=================================================="
                menu

            elsif user_input == "3"
                JobObjects::Job.random
                menu
                
            elsif user_input == "menu"
                menu

            elsif user_input == "exit"
                puts "=================================================="
                puts "Goodbye!"
                puts "=================================================="
            else
                puts "Please pick an option from the menu."
                puts "=================================================="

            end


        end


    end


end