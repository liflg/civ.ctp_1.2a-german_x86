Setup.Package
{
 	vendor = "liflg.org",
 	id = "civ_ctp",
 	description = "Civilization: Call To Power",
 	version = "1.2a-german",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "civ-disc",
		description = "Civilization: Call To Power Loki Disc",
		uniquefile = "CivCTP-data.tar.gz"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Civilization: Call to Power",
		bytes = 602729714,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Civilization: Call To Power",
                        genericname = "Civilization: Call To Power",
                        tooltip = "Play Civilization: Call To Power",
                        builtin_icon = false,
                        icon = "CivCTP/icon.xpm",
                        commandline = "%0/civctp.sh",
                        category = "Game",
                },

		Setup.File {
			source = "media://civ-disc/CivCTP-data.tar.gz",
		},

		Setup.File {
			source = "media://civ-disc/CivCTP-x86-glibc-2.1.tar.gz",
			filter = function(dest)
				if dest == "civctp" then
					return dest, "0755"
				end
				return dest
			end
		},

		Setup.File {
			source = "base:///video.tar.xz",
		},
		
		Setup.File 
		{
			wildcards = "civctp.sh",
			permissions = "0755",
		},
		Setup.File
		{	
			wildcards = "README.liflg"
		},

		Setup.File {
			source = "media://civ-disc/runtime",
			destination = "CivCTP",
			filter = function(dest)
				if ( string.match(dest, "gw38a.mpg") ) then
					return nil
				end
				return dest
			end
		},

		Setup.Option {
			required = true,
			value = true,
			description = "Apply Patch 1.2a",
			tooltip = "Latest update from Loki",
			bytes = 198834251,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.2a.tar.xz",
				filter = function(dest)
					if ( string.match( dest, "CivCTP/civctp" ) ) then
						return dest, "0755"
					end
					if ( string.match( dest, "CivCTP" ) ) then
						return dest
					end
					return nil
				end
			},

			Setup.File{
				allowoverwrite = true,
				permissions = "0755",
				wildcards = "civctp.dynamic.sh",
			}
		},
				
		Setup.Option {
			value = true,
			required = true,
			description = "Install the Sprite Tool",
			bytes = 11273219,
			Setup.File {
				source = "base:///makespr-0.3-x86.tar.xz",
				filter = function(dest)
					if dest == "makespr" then
						return dest, "0755"
					end
					return dest
				end
			},

			Setup.File {
				wildcards = "makespr.sh",
				permissions = "0755",
			},
		},
	},
}			
