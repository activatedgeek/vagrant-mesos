%:
	@$(eval ATLAS_TOKEN := $(shell cat ATLAS_TOKEN))
	@ATLAS_TOKEN=$(ATLAS_TOKEN) packer push $@.json
