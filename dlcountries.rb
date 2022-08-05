require "nokogiri"
require "open-uri"

#@doc=Nokogiri::HTML(URI.open("https://www.mylanguageexchange.com/SignUp.asp?showmenu=1&lang=fr"))
@doc=Nokogiri::HTML(File.read("./app/views/members/registrations/_pays.html.erb"))
@doc.css("option").each do |opt|
next if opt.text.strip.squish==""
Country.find_or_create_by(:no => opt.attributes['value'].value,:name_fr => opt.text.strip.squish)
end
