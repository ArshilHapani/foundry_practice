-include .env

.PHONY: test deploy install

install :
		@forge install openzeppelin/openzeppelin-contracts@v5.0.2 --no-commit
		@forge install dmfxyz/murky --no-commit
		@forge install cyfrin/foundry-devops --no-commit

setupTargetFiles:
		@forge script script/GenerateInput.s.sol
		@forge script script/MakeMerkle.s.sol