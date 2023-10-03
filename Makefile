# Simple Makefile providing an interface for cmake. Oh, sweet irony

BUILD_DIR = build

.PHONY = run all setup build test clean

# Clean, build, test, and run
all:	clean	test	run

# Initialise cmake build files at BUILD_DIR
setup:	CMakeLists.txt
	cmake -H. -B$(BUILD_DIR) > /dev/zero

# Build the project (lib and src)
build:	setup
	cmake --build $(BUILD_DIR) --target XXTEMPLATEXX > /dev/zero

# Build the benchmarking tool
run:	build
	./$(BUILD_DIR)/XXTEMPLATEXX

# Build and run the tests
test:	build
	cmake --build $(BUILD_DIR) --target Test > /dev/zero
	./$(BUILD_DIR)/Test

# Clean all build files
clean:
	rm -rf $(BUILD_DIR)
