require 'nokogiri'
require 'open-uri'

class Scrapper
  def get_townhall_urls
    base_url = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
    page = Nokogiri::HTML(URI.open(base_url))
    townhall_urls = []

    page.css('a.lientxt').each do |link|
      townhall_url = "https://www.annuaire-des-mairies.com#{link['href'][1..-1]}"
      townhall_urls << townhall_url
    end

    townhall_urls
  end

  def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    email = page.css('td:contains("@")').text.strip
    email
  end

  def get_townhall_emails
    townhall_urls = get_townhall_urls
    townhall_emails = []

    townhall_urls.each do |url|
      email = get_townhall_email(url)
      townhall_name = url.split('/')[-1].gsub(/-|\.html/, '').capitalize
      townhall_emails << { townhall_name => email }
    end

    townhall_emails
  end
end
