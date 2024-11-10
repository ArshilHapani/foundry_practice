-include .env

.PHONY: install deploy-sepolia deploy-polygon

install:
	@forge install eth-infinitism/account-abstraction@v0.7.0 --no-commit
	@forge install cyfrin/foundry-devops@0.2.3 --no-commit
	@forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit

deploy-sepolia:
	@forge script script/DeployMinimalAccount.s.sol --rpc-url $(SEPOLIA_URL) --account metamask_default --broadcast --verify

deploy-polygon:
	@forge script script/DeployMinimalAccount.s.sol --rpc-url $(POLYGON_AMONY_URL) --account metamask_default --broadcast

send-user-operation-sepolia:
	@forge script script/SendPackedUserOp.s.sol --rpc-url $(SEPOLIA_URL) --account metamask_default --broadcast -vvv

send-user-operation-amony:
	@forge script script/SendPackedUserOp.s.sol --rpc-url $(POLYGON_AMONY_URL) --account metamask_default --broadcast -vvv


# zkSync stuff
compile:
	@forge compile --zksync --system-mode=true --via-ir
