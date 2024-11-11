-include .env

.PHONY: install deploy-sepolia deploy-polygon

install:
	# @forge install cyfrin/foundry-devops@0.2.3 --no-commit
	@forge install openzeppelin/openzeppelin-contracts@v5.1.0 --no-commit

# zkSync stuff
compile:
	@forge compile --zksync --system-mode=true --via-ir
