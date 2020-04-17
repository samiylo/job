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
        menu 

        user_input = gets.strip.downcase

        while user_input != "exit"

        end
        

    end


end