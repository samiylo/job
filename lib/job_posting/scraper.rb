
class JobObjects
    def scraper
        url = "https://www.indeed.com/l-Kingwood,-TX-jobs.html"
        raw_html = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(raw_html)

        job_cards = parsed_page.css('div.jobsearch-SerpJobCard')  #15 JOBS

        job_cards.each do |job_listing|

        end
        
        binding.pry

    end

end


