#pragma once

#ifdef NB_PLATFORM_WINDOWS
	#ifdef NB_BUILD_DLL
		#define NEBULA_API _declspec(dllexport)
	#else
		#define NEBULA_API _declspec(dllimport)
	#endif
#else
	#error Nebula only supports Windows.
#endif