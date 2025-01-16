GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# Proto 目录路径
PROTO_DIR := lib/common/net/grpcs/proto
# 目标目录，可以通过命令行参数指定，例如：make proto m=user 或 make proto m=user
TARGET_DIR ?= $(if $(m),$(m),.)
TARGET_DIR := $(if $(TARGET),$(TARGET),$(TARGET_DIR))

# 默认目标
.PHONY: all
all: proto

# 生成 proto 文件
.PHONY: proto
proto:
	@echo "$(YELLOW)Generating proto files in $(PROTO_DIR)/$(TARGET_DIR)...$(RESET)"
	@cd $(PROTO_DIR) && find $(TARGET_DIR) -name "*.proto" -exec protoc \
		--dart_out=grpc:. \
		--proto_path=. \
		{} \;
	@echo "$(GREEN)✓ Proto files generated successfully!$(RESET)"

# 清理生成的文件
.PHONY: clean-proto
clean-proto:
	@if [ "$(TARGET_DIR)" = "." ]; then \
		echo "$(YELLOW)Cleaning all generated proto files...$(RESET)"; \
		find $(PROTO_DIR) -name "*.pb.dart" -delete; \
		find $(PROTO_DIR) -name "*.pbenum.dart" -delete; \
		find $(PROTO_DIR) -name "*.pbgrpc.dart" -delete; \
		find $(PROTO_DIR) -name "*.pbjson.dart" -delete; \
	else \
		echo "$(YELLOW)Cleaning generated proto files in $(PROTO_DIR)/$(TARGET_DIR)...$(RESET)"; \
		find $(PROTO_DIR)/$(TARGET_DIR) -name "*.pb.dart" -delete; \
		find $(PROTO_DIR)/$(TARGET_DIR) -name "*.pbenum.dart" -delete; \
		find $(PROTO_DIR)/$(TARGET_DIR) -name "*.pbgrpc.dart" -delete; \
		find $(PROTO_DIR)/$(TARGET_DIR) -name "*.pbjson.dart" -delete; \
	fi
	@echo "$(GREEN)✓ Generated proto files cleaned$(RESET)"

# 清理构建缓存和临时文件
.PHONY: clean
clean:
	@echo "$(YELLOW)Cleaning build files and cache...$(RESET)"
	@flutter clean
	@rm -rf build/
	@rm -rf .dart_tool/
	@rm -rf .flutter-plugins
	@rm -rf .flutter-plugins-dependencies
	@echo "$(GREEN)✓ Build files cleaned$(RESET)"

# 获取依赖
.PHONY: deps
deps:
	@echo "$(YELLOW)Getting dependencies...$(RESET)"
	@flutter pub get
	@echo "$(GREEN)✓ Dependencies updated$(RESET)"

# 运行代码生成
.PHONY: gen
gen:
	@echo "$(YELLOW)Running code generation...$(RESET)"
	@flutter pub run build_runner build --delete-conflicting-outputs
	@echo "$(GREEN)✓ Code generation completed$(RESET)"

# 运行测试
.PHONY: test
test:
	@echo "$(YELLOW)Running tests...$(RESET)"
	@flutter test
	@echo "$(GREEN)✓ Tests completed$(RESET)"

# 分析代码
.PHONY: analyze
analyze:
	@echo "$(YELLOW)Analyzing code...$(RESET)"
	@flutter analyze
	@echo "$(GREEN)✓ Code analysis completed$(RESET)"

# 格式化代码
.PHONY: format
format:
	@echo "$(YELLOW)Formatting code...$(RESET)"
	@dart format lib/
	@echo "$(GREEN)✓ Code formatting completed$(RESET)"

# 构建发布版本
.PHONY: build
build:
	@echo "$(YELLOW)Building release version...$(RESET)"
	@flutter build $(if $(p),$(p),web)
	@echo "$(GREEN)✓ Build completed$(RESET)"

# 运行开发服务器
.PHONY: run
run:
	@echo "$(YELLOW)Starting development server...$(RESET)"
	@flutter run -d $(if $(d),$(d),chrome) $(if $(p),--flavor $(p),)
	@echo "$(GREEN)✓ Development server started$(RESET)"

# 升级 Flutter SDK 和依赖
.PHONY: upgrade
upgrade:
	@echo "$(YELLOW)Upgrading Flutter SDK and dependencies...$(RESET)"
	@flutter upgrade
	@flutter pub upgrade
	@echo "$(GREEN)✓ Upgrade completed$(RESET)"

# 检查项目健康状况
.PHONY: doctor
doctor:
	@echo "$(YELLOW)Checking Flutter installation and project setup...$(RESET)"
	@flutter doctor -v
	@echo "$(GREEN)✓ Health check completed$(RESET)"

# 一键初始化项目
.PHONY: init
init: clean deps gen

# 一键准备发布
.PHONY: release
release: clean deps gen test analyze format build

# 监听模式运行代码生成
.PHONY: watch
watch:
	@echo "$(YELLOW)Starting code generation in watch mode...$(RESET)"
	@flutter pub run build_runner watch --delete-conflicting-outputs
	@echo "$(GREEN)✓ Watch mode started$(RESET)"

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make proto          - Generate all proto files"
	@echo "  make proto m=user   - Generate proto files in user directory (short form)"
	@echo "  make proto TARGET=user - Generate proto files in user directory"
	@echo "  make clean-proto    - Clean all generated proto files"
	@echo "  make clean-proto m=user - Clean generated proto files in user directory"
	@echo "  make clean         - Clean build files and cache"
	@echo "  make deps          - Get dependencies"
	@echo "  make gen           - Run code generation"
	@echo "  make test          - Run tests"
	@echo "  make analyze       - Analyze code"
	@echo "  make format        - Format code"
	@echo "  make build         - Build release version (default: web)"
	@echo "  make build p=ios   - Build for specific platform (ios/android/web)"
	@echo "  make run           - Start development server (default: chrome)"
	@echo "  make run d=chrome p=dev - Run with specific device and flavor"
	@echo "  make upgrade       - Upgrade Flutter SDK and dependencies"
	@echo "  make doctor        - Check Flutter installation and setup"
	@echo "  make init          - Initialize project (clean + deps + gen)"
	@echo "  make release       - Prepare for release (clean + deps + gen + test + analyze + format + build)"
	@echo "  make watch         - Run code generation in watch mode"
	@echo "  make help          - Show this help message" 