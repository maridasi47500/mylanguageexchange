require "nokogiri"
require "open-uri"

@doc=Nokogiri::HTML(File.read("./nationalities.html.erb"))
@doc.css("a").each do |opt|
next if opt.text.strip.squish==""
country=Country.find_or_create_by(:name_fr => opt.text.strip.squish)
country.update(nationality: opt.attributes['title'].value.split(' teacher')[0])
end

