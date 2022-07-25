require "nokogiri"
require "open-uri"

@doc=Nokogiri::HTML(URI.open("https://www.mylanguageexchange.com/SignUp.asp?showmenu=1&lang=fr"))
@doc.css("#selX3 option").each do |opt|
Language.find_or_create_by(:name_fr => opt.text.strip.squish)
end
