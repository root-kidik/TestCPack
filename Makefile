PRESETS ?= debug release

.PHONY: $(addprefix cmake-, $(PRESETS))
$(addprefix cmake-, $(PRESETS)): cmake-%:
	cmake --preset $*

.PHONY: $(addprefix build-, $(PRESETS))
$(addprefix build-, $(PRESETS)): build-%: cmake-%
	cmake --build --preset build-$*

.PHONY: $(addprefix test-, $(PRESETS))
$(addprefix test-, $(PRESETS)): test-%: build-%
	ctest --preset test-$* --output-junit junit.xml -T test --test-dir build-$*

.PHONY: $(addprefix cpack-, $(PRESETS))
$(addprefix cpack-, $(PRESETS)): cpack-%: build-%
	cpack --preset cpack-$*

.PHONY: clear
clear:
	rm -rf build*

.PHONY: format
format:
	find src tests -name '*pp' -type f | xargs clang-format -i
	find src tests -name '*.inl' -type f | xargs clang-format -i
