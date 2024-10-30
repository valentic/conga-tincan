export BR2_EXTERNAL += $(realpath tincan)
export BR2_GLOBAL_PATCH_DIR += $(realpath tincan)

.DEFAULT_GOAL := all

%:
	$(MAKE) -C buildroot $@
