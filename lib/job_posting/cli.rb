class Cli


    def menu
        puts "What would you like to do?"
        puts "1 - List all jobs."
        puts "2 - Search job by area."
        puts "3 - Pick random job"
        puts "Or type MENU for menu, or EXIT to exit the app."

    end

    def run
        puts "Hello! Welcome to my Kingwood job search app."
        JobObjects.new.scraper
        menu 


        user_input = nil

        while user_input != "exit"
            user_input = gets.strip.downcase
            if user_input == "1"
                JobObjects.all_jobs
            elsif user_input == "2"

            elsif user_input == "3"

            else
                "Please pick an option from the menu."

            end


        end


    end


end