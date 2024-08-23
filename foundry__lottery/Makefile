-include .env

build:; forge build

fund_manually:
	@echo "Funding manually"
	@forge script script/Interactions.s.sol:FundSubscription --rpc-url $(SEPOLIA_URL) --account metamask7de --broadcast
# 			 <your_wallet_name>

install:
	@echo "Installing packages"
	@forge install smartcontractkit/chainlink-brownie-contracts --no-commit
	@forge install transmissions11/solmate --no-commit
	@forge install Cyfrin/foundry-devops --no-commit

runTests:
	@echo "Running tests"
	@forge test

coverage_report:
	@echo "Generating coverage report"
	@forge coverage --report debug > coverage_report.txt