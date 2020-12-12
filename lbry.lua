--Translate lrby.tv video webpages URLs to corresponding video stream URLs.
-- Author: 〈 RA 〉 (github.com/ra101)


-- Probe function.
function probe()
	return ( vlc.access == "http" or vlc.access == "https" )
		and ( string.match( vlc.path, "^lbry%.tv/@.+/.+" ) or string.match( vlc.path, "^lbry%.tv/.+" ) ) 
end

-- Parse function.
function parse()
	vlc.msg.info("Using roosterteeth plugin")
	local path, url, name, description, arturl, artist

	while true do
		line = vlc.readline()
		if not line then break end
			if string.match( line, "<meta property=\"og:video\"" ) then
				_,_,url = string.find( line, "content=\"https://lbry.tv/$/embed/(.-)?\"" )
			end

			if string.match( line, "<meta property=\"og:title\"" ) then
				_,_,name = string.find( line, "<meta property=\"og:title\" content=\"(.-)\"" )
				name = vlc.strings.resolve_xml_special_chars( name )
			end

			if string.match( line, "<meta name=\"description\"" ) then
				_,_,description = string.find( line, "<meta name=\"description\" content=\"(.-)\"" )
				if (description ~= nil) then
					description = vlc.strings.resolve_xml_special_chars( description )
				end
			end

			if string.match( line, "<meta property=\"og:image\"" ) then
				arturl = string.match( line, "<meta property=\"og:image\" content=\"(.-)\"" )
			end

			if string.match( line, "<meta name=\"og:video:series\"" ) then
				artist = string.match( line, "<meta name=\"og:video:series\" content=\"https(.-)\"" )
			end
	end

	path = "https://cdn.lbryplayer.xyz/api/v3/streams/free/"..url.."/"..string.gsub( name, ' ', '%%20' )

	return { { path = path, name = name, description = description, arturl = arturl, artist = artist } }
end
