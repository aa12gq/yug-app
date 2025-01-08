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

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make proto          - Generate all proto files"
	@echo "  make proto m=user   - Generate proto files in user directory (short form)"
	@echo "  make proto TARGET=user - Generate proto files in user directory"
	@echo "  make clean-proto    - Clean all generated proto files"
	@echo "  make clean-proto m=user - Clean generated proto files in user directory"
	@echo "  make help          - Show this help message" 