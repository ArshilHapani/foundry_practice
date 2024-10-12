-include .env

.PHONY: test deploy install

NETWORK_ARGS := --rpc-url $(RPC_URL) --account $(ACCOUNT_NAME) --broadcast

install :
		@forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit
		@forge install dmfxyz/murky --no-commit
		@forge install cyfrin/foundry-devops --no-commit

setupTargetFiles:
		@forge script script/GenerateInput.s.sol
		@forge script script/MakeMerkle.s.sol

setup:
	@echo "Preparing input and merkle tree"
	@forge script script/GenerateInput.s.sol && forge script script/MakeMerkle.s.sol

deploy:	
	@echo "Deploying contracts and minting tokens"
	@forge script script/DeployMerkleAirdrop.s.sol $(NETWORK_ARGS)

getMessageHash:
	@if [ -z "$(contract)" ]; then \
		echo "Please provide contract address: make getMessageHash contract=<address>"; \
		exit 1; \
	fi
	@if [ -z "$(receiver)" ]; then \
		echo "Please provide receiver address: make getMessageHash contract=<address> receiver=<address>"; \
		exit 1; \
	fi	
	@cast call $(contract) "getMessageHash(address,uint256)" $(receiver) 25000000000000000000 --rpc-url $(RPC_URL)

signMessage:
	@if [ -z "$(bytes)" ]; then \
		echo "Please provide bytes: make signMessage bytes=<bytes>"; \
		exit 1; \
	fi	
	@cast wallet sign --no-hash $(bytes) --account $(ACCOUNT_NAME)