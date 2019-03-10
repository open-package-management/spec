.PHONY: test
test:
	go test ./...

.PHONY: schemas
schemas: clean
	jsonnet -m schema schema/generate.jsonnet
	printf "%s\n\n%s\n" "$$(cat .header)" "$$(go generate schema/generate.go)" > schema/fs.go

.PHONY: openapi
openapi:
	jsonnet -o openapi/openapi.json openapi/openapi.libsonnet

.PHONY: clean
clean:
	rm -rf *.json
