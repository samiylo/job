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
                puts "=================================================="
                puts "Would you like to see the Discription and Requirements? Type yes or no."
                go_deep = gets.strip.downcase
                if go_deep == "yes"
                    JobObjects.description(usr_input)
                    puts "=================================================="
                    puts "Type MENU for menu."
                    puts "=================================================="
                elsif go_deep == "no"
                    puts "Returning you to menu..."
                    menu
                else
                    puts "Please type yes or no."

                end

            elsif user_input == "3"
                random_job
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