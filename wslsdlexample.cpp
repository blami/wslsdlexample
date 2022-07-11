#include <iostream>
#include <SDL.h>

int main(int argc, char *argv[]) {
	if(SDL_Init(SDL_INIT_EVERYTHING) != 0) {
		std::cout << "error:" << SDL_GetError() << std::endl;
	}
	SDL_Window* w;
	SDL_Renderer* r;

	w = SDL_CreateWindow("WSL SDL Example",
			SDL_WINDOWPOS_CENTERED,
			SDL_WINDOWPOS_CENTERED,
			600, 600, 0);
	r = SDL_CreateRenderer(w, -1, 0);

	// Draw
	SDL_SetRenderDrawColor(r, 0, 0, 0, 0);
	SDL_RenderClear(r);
	SDL_SetRenderDrawColor(r, 0, 255, 0, 255);
	for(int i = 0; i < 600; i++) {
		SDL_RenderDrawPoint(r, i, i);
	}
	SDL_RenderPresent(r);

	// Wait
	SDL_Event e;
	while(1) {
		if(SDL_PollEvent(&e) && (e.type == SDL_QUIT || e.type == SDL_KEYDOWN))
			break;
	};

	// Clean up
	SDL_DestroyRenderer(r);
	SDL_DestroyWindow(w);
	SDL_Quit();

	return 0;
}
