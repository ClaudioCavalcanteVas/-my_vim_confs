all: build

build:
	@docker build --tag="neovim:$(if $(version),$(version),latest)" .

	
