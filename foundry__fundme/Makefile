-include .env

# .PHONY robin nami

build:
	@echo "Building the project..."
	forge build

deploy-sepolia:
	echo "Deploying to Sepolia..."
	forge script script/DeployFundMe.s.sol:DeployFundMe \ 
			--rpc-url $(SEPOLIA_URL) --private-key $(PRIVATE_KEY) \
			--broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvv
robin:
	@echo "Robin"

nami: robin
	@echo "After building..."
	@ls