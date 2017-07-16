#!/usr/bin/env ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

URL_BC = "https://coinmarketcap.com/all/views/all/"

def url_parser #
  page = Nokogiri::HTML(open("#{URL_BC}"))
  return page
end

def c_regex_search(string)
  requete = /\w+\.?\+?\w+?@\w+\-?\w+\.\w+/ #query regex email de mairie // à refacto
  regex_mail = string.match requete
  unless regex_mail == nil
      regex_mail = regex_mail.to_s
      @e_mail_mairie = regex_mail
  end
end


def get_the_currency
  @crypto_contes = {}
  @index_crypto = []
  iterateur = 0
  doc = url_parser
 # p link
  doc.css('tr > td.no-wrap.currency-name > a').each do |node|
    @texte_a_chercher = node.text
    @index_crypto.push(@texte_a_chercher)
    @crypto_contes[@texte_a_chercher] = Hash.new()
    @crypto_contes[@texte_a_chercher]["monnaie:"] = @texte_a_chercher
  end

  doc.css('.price').each do |prix|
    #puts @texte_a_chercher
    prix_a_chercher = prix.text
    crypto_name = @index_crypto[iterateur]
    @crypto_contes[crypto_name]["price:"] = prix_a_chercher
    #mail_regex_search(texte_a_chercher)  #appel de la fonction regex, retour du mail
    iterateur += 1
    end

# p @index_crypto
 #puts @crypto_contes

 @crypto_contes.each do |node|
  puts node
  end
  puts @crypto_contes.length
 # p @crypto_contes

end #fin fonction


get_the_currency
