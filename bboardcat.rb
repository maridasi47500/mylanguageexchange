require "nokogiri"
require "open-uri"

@doc=Nokogiri::HTML(File.read("./bboardcat.html"))
@doc.css("a").each do |opt|
  no=opt.attributes['href'].value

next if opt.text.strip.squish==""
 Bboardcat.find_or_create_by(:name_fr => opt.text.strip.squish,description_fr: opt.parent.parent.inner_html.split('<br>')[1].to_s.squish.strip)
end

