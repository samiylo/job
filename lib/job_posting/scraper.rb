
class JobObjects


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
                }
                
                all << job
            end
            page += 1
        end

        binding.pry
    end
    
end


