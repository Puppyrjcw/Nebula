#pragma once

#ifdef NB_PLATFORM_WINDOWS
#include "Log.h"

extern Nebula::Application* Nebula::CreateApplication();

int main(int argc, char** argv) 
{
	Nebula::Log::Init();
	NB_CORE_WARN("Initalized Log");
	NB_INFO("Nebula Client");

	auto app = Nebula::CreateApplication();
	app->Run();
	delete app;
}

#endif