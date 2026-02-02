#pragma once

#ifdef NB_PLATFORM_WINDOWS

extern Nebula::Application* Nebula::CreateApplication();

int main(int argc, char** argv) 
{
	printf("Nebula Engine\nWelcome to Nebula engine, the application will begin shortly\n");
	auto app = Nebula::CreateApplication();
	app->Run();
	delete app;
}

#endif