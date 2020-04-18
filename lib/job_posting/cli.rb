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
                JobObjects.all_jobs
                menu
            elsif user_input == "2"
                JobObjects.all_jobs
                puts "=================================================="
                puts "Please enter a job name:"
                usr_input = gets.strip
                puts "=================================================="
                JobObjects.search(usr_input)
                # JobObjects.description(usr_input)


            elsif user_input == "3"
                random_job
                menu
                
            elsif user_input == "menu"
                menu
            else
                puts "Please pick an option from the menu."
                puts "=================================================="

            end


        end


    end


end