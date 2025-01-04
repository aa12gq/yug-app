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
proto: proto-user-frontend proto-user-shared proto-system
	@echo "$(GREEN)All proto files generated successfully!$(RESET)"

# 生成 user/frontend proto 文件
.PHONY: proto-user-frontend
proto-user-frontend:
	@echo "$(YELLOW)Generating user frontend protos...$(RESET)"
	@cd $(PROTO_DIR) && protoc --dart_out=grpc:. --proto_path=. user/frontend/v1/*.proto
	@echo "$(GREEN)✓ User frontend protos generated$(RESET)"

# 生成 user/shared proto 文件
.PHONY: proto-user-shared
proto-user-shared:
	@echo "$(YELLOW)Generating user shared protos...$(RESET)"
	@cd $(PROTO_DIR) && protoc --dart_out=grpc:. --proto_path=. user/shared/v1/*.proto
	@echo "$(GREEN)✓ User shared protos generated$(RESET)"

# 生成 system proto 文件
.PHONY: proto-system
proto-system:
	@echo "$(YELLOW)Generating system protos...$(RESET)"
	@cd $(PROTO_DIR) && protoc --dart_out=grpc:. --proto_path=. system/v1/*.proto
	@echo "$(GREEN)✓ System protos generated$(RESET)"

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