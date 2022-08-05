require "nokogiri"
require "open-uri"

#@doc=Nokogiri::HTML(URI.open("https://www.mylanguageexchange.com/SignUp.asp?showmenu=1&lang=fr"))
@doc=Nokogiri::HTML(File.read("./app/views/members/registrations/_langues.html.erb"))
@doc.css(".select2-results__option").each do |opt|
next if opt.text.strip.squish==""
Language.find_or_create_by(:name_fr => opt.text.strip.squish)
end
