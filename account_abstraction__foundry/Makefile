-include .env

.PHONY: install deploy-avalanche

install:
	@forge install eth-infinitism/account-abstraction@v0.7.0 --no-commit
	@forge install cyfrin/foundry-devops@0.2.3 --no-commit
	@forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit

deploy-avalanche:
	@forge script script/DeployMinimalAccount.s.sol --rpc-url $SEPOLIA_URL --account metamask_default --broadcast --verify