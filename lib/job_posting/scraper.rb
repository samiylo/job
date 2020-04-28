
class JobObjects

    class Job

        @@all = []

        attr_accessor :name, :company, :location, :url

        def initialize(name, company, location = nil, url)
            @name = name
            @company = company
            @location = location
            @url = url
            
            @@all << self
        end

        def self.all
            @@all.each do |listing|
                puts "Position Title:   #{listing.name}"
                puts "Company:          #{listing.company}"
                # puts "                  Location not disclosed"
                # puts "Location:         #{listing.location}"
                if listing.location == ""
                    puts "                  Location not disclosed"

                else
                    puts "Location:         #{listing.location}"
                end
                puts "=================================================="
                
            end

        end

        def self.search(job_name)
            @@all.each do |listing|
                if job_name == listing.name
                    puts "Position Title:   #{listing.name}"
                    puts "Company:          #{listing.company}"
                    # puts "                  Location not disclosed"
                    # puts "Location:         #{listing.location}"
                    if listing.location == ""
                        puts "                  Location not disclosed"
    
                    else
                        puts "Location:         #{listing.location}"
                    end
                    puts "=================================================="
                    puts "DESCRIPTION"
                    puts "=================================================="
                    self.description(job_name)
                    
                end
            end

        end

        def self.description(job_name)
            @@all.each do |listing|
                if job_name == listing.name
                    url = listing.url
                    raw_html = HTTParty.get(url)
                    parsed_page = Nokogiri::HTML(raw_html)
                    description = parsed_page.css('div#jobDescriptionText').text.strip
                    puts "=================================================="
                    puts description
                    # binding.pry
                end
            end

        end

        def self.random 
            rand_num = rand(10)
            job = @@all[rand_num]
            puts "#{job.name}"
            puts "#{job.company}"
            puts "#{job.location}"
        end





    end


    # Start scraper logic

    def scraper

        all = []

        url = "https://www.indeed.com/l-Kingwood,-TX-jobs.html"
        raw_html = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(raw_html)

        job_cards = parsed_page.css('div.jobsearch-SerpJobCard')  #15 JOBS

        page = 1
        per_page = job_cards.count #Counts the number of jobs on a page
        last_page = 1

        while page <= last_page
            job_cards.each do |job_listing|
                
                name = job_listing.css('h2.title').text.strip
                company = job_listing.css('span.company').text.strip
                location = job_listing.css('div.location').text
                url = "https://www.indeed.com/" + job_listing.css('a')[0].attributes['href'].value
                
                Job.new(name, company, location, url)
                
            end
            page += 1
        end

        # binding.pry
    end

end