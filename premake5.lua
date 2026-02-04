workspace "Nebula"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Nebula

project "Nebula"
	location "Nebula"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }

		defines
		{
			"NB_PLATFORM_WINDOWS",
			"NB_BUILD_DLL",
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	filter "configurations:Debug"
		defines "NB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "NB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "NB_DIST"
		optimize "On"

-- Sandbox

project "Sandbox"
	location "Sandbox"
	language "C++"
	kind "ConsoleApp"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Nebula/vendor/spdlog/include",
		"Nebula/src"
	}

	links
	{
		"Nebula"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }

		defines
		{
			"NB_PLATFORM_WINDOWS",
		}

	filter "configurations:Debug"
		defines "NB_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "NB_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "NB_DIST"
		optimize "On"