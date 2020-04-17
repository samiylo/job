
class JobObjects
    def scraper
        url = "https://www.indeed.com/l-Kingwood,-TX-jobs.html"
        raw_html = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(raw_html)
        binding.pry

    end

end


