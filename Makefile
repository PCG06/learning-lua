LUA_FILES := $(wildcard src/*.lua)

check:
	@echo "Checking Lua syntax..."
	@for f in $(LUA_FILES); do \
		echo " - $$f"; \
		luac -p $$f || exit 1; \
	done
	@echo "No syntax error detected!"

.PHONY: check