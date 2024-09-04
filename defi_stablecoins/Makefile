-include .env

.PHONY: test deploy install

install:
	@forge install OpenZeppelin/openzeppelin-contracts@v5.0.2 --no-commit
	@forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit	
	# @forge install Cyfrin/foundry-devops@0.2.2 --no-commit

updateMappings:
	@forge remappings > remappings.txt