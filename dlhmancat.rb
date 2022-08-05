require "nokogiri"
require "open-uri"

#@doc=Nokogiri::HTML(URI.open("https://www.mylanguageexchange.com/SignUp.asp?showmenu=1&lang=fr"))
@doc=Nokogiri::HTML(File.read("./app/views/hangman/_categories.html.erb"))
@doc.css("option").each do |opt|
next if opt.text.strip.squish==""
Hangmancat.find_or_create_by(:name_fr => opt.text.strip.squish)
end
