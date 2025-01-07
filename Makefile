# 颜色代码
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

# Proto 相关变量
PROTO_DIR := lib/common/net/grpcs/proto

# 默认目标
.PHONY: all
all: proto

# 生成所有 proto 文件
.PHONY: proto
proto:
	@echo "$(YELLOW)Generating all proto files...$(RESET)"
	@cd $(PROTO_DIR) && find . -name "*.proto" -exec protoc \
		--dart_out=grpc:. \
		--proto_path=. \
		{} \;
	@echo "$(GREEN)✓ All proto files generated successfully!$(RESET)"

# 清理生成的文件
.PHONY: clean-proto
clean-proto:
	@echo "$(YELLOW)Cleaning generated proto files...$(RESET)"
	@find $(PROTO_DIR) -name "*.pb.dart" -delete
	@find $(PROTO_DIR) -name "*.pbenum.dart" -delete
	@find $(PROTO_DIR) -name "*.pbgrpc.dart" -delete
	@find $(PROTO_DIR) -name "*.pbjson.dart" -delete
	@echo "$(GREEN)✓ All generated proto files cleaned$(RESET)"

# 帮助信息
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  make proto          - Generate all proto files"
	@echo "  make clean-proto    - Clean all generated proto files"
	@echo "  make help          - Show this help message" 