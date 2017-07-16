require 'rubygems'
require 'nokogiri'
require 'open-uri'



def road_to_philosophy(url)

	#Initialisation
	puts "Your search for philosophy started here #{url}"
	page = Nokogiri::HTML(open(url))

	title_xpath = '//*[@id="firstHeading"]'
	title = page.xpath(title_xpath).text
	puts title

	links_xpath = '//*[@id="mw-content-text"]/div/p/a'
	links = page.xpath(links_xpath)
	puts links[0]['href']

	#Boucle
	while title != "Philosophie"
		url = links[0]['href']
		title_xpath = '//*[@id="firstHeading"]'
	#end
end


def perform
	start_url = 'https://fr.wikipedia.org/wiki/Sangro'
	road_to_philosophy(start_url)
end

perform()
