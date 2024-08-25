-include .env

.PHONY: test build install setup

setup:; @forge remappings > remappings.txt

test:; forge test

build:; forge build

install:
	@echo "Installing packages"
	@forge install OpenZeppelin/openzeppelin-contracts@v5.0.2 --no-commit
	@forge install Cyfrin/foundry-devops@0.2.2 --no-commit
	@forge install foundry-rs/forge-std@v1.8.2 --no-commit
	# @forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit	

NETWORK_ARGS := --rpc-url http://localhost:8545 --account nami --broadcast

ifeq ($(findstring --network sepolia,$(ARGS)), --network sepolia)
	@echo "Deploying to Sepolia"
	NETWORK_ARGS := --rpc-url $(SEPOLIA_URL) --account metamask7de --broadcast
endif

deploy:
	@forge script script/DeployBasicNFT.s.sol:DeployBasicNFT $(NETWORK_ARGS)

mint:
	@forge script script/Interactions.s.sol:MintBasicNFT $(NETWORK_ARGS)