
class JobObjects


    @@all = []

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
                job = {
                    title: job_listing.css('h2.title').text.strip,
                    company: job_listing.css('span.company').text.strip,
                    location: job_listing.css('div.location').text,
                    url: "https://www.indeed.com/" + job_listing.css('a')[0].attributes['href'].value
                }
                
                
                @@all << job
                # puts "Added #{job[:title]}"
            end
            page += 1
        end

        # binding.pry
    end

    def self.description(link)
        url = link
        

    end


    def self.random
        rand_num = rand(10)
        job = @@all[rand_num]
        puts "#{job[:title]}"
        puts "#{job[:company]}"
        puts "#{job[:location]}"


    end

    def self.search(job_name)
        @@all.each do |job|
            if job_name == job[:title]
                puts "=================================================="
                puts "#{job[:title]}"
                puts "#{job[:company]}"
                puts "#{job[:location]}"
                puts "=================================================="
                
            end

        end
        
    end



    def self.all_jobs
        counter = 1
        @@all.each do |job|
            puts "#{counter} - #{job[:title]}"
            counter += 1
        end

    end


    def self.all 
        @@all 
    end

    
end


