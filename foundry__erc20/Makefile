-include .env

.PHONY: test build install

build:; forge build

test:; forge test

install:
	@forge install OpenZeppelin/openzeppelin-contracts@v5.0.2 --no-commit

remove:
	@rm -rf .gitmodules
	@rm -rf .git/modules/*
	@rm -rf lib
	@touch .gitmodules
	@git add .
	@git commit -m "Modules"