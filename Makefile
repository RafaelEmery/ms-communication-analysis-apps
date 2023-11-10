run: 
	@echo "Running..."
	@go run cmd/main.go

deps:
	go mod download
	go mod tidy

start:
	@docker-compose up -d

stop:
	@docker-compose down

restart: 
	@docker-compose restart

proto-generate:
	@rm internal/apps/message_grpc.pb.go
	@rm internal/apps/message.pb.go
	protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative ./internal/apps/message.proto