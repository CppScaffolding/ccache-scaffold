-- scaffold geniefile for ccache

ccache_script = path.getabsolute(path.getdirectory(_SCRIPT))
ccache_root = path.join(ccache_script, "ccache")

ccache_includedirs = {
	path.join(ccache_script, "config"),
	ccache_root,
}

ccache_libdirs = {}
ccache_links = {}
ccache_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { ccache_includedirs }
	end,

	_add_defines = function()
		defines { ccache_defines }
	end,

	_add_libdirs = function()
		libdirs { ccache_libdirs }
	end,

	_add_external_links = function()
		links { ccache_links }
	end,

	_add_self_links = function()
		links { "ccache" }
	end,

	_create_projects = function()

project "ccache"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		ccache_includedirs,
	}

	defines {}

	files {
		path.join(ccache_script, "config", "**.h"),
		path.join(ccache_root, "**.h"),
		path.join(ccache_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
