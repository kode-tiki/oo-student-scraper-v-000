require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url_path_only = index_url.split("/")
    index_url_path_only.pop
    index_url_path_only = index_url_path_only.join("/")

    doc = Nokogiri::HTML(open(index_url))

    students = doc.css("div.student-card")

    students_array = []

    students.each do |student|


      students_array << {

        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => index_url_path_only + "/students/" + student.css("a").attribute("href").value
      }

    end



binding.pry
    students_array
  end

  def self.scrape_profile_page(profile_url)

  end

end
