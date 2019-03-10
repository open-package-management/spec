.PHONY: test
test:
	go test ./...

.PHONY: schemas
schemas:
	find schema -name generate.jsonnet -execdir jsonnet -m . {} \;

.PHONY: embed-schemas
embed-schemas:
	printf "%s\n\n%s\n" "$$(cat .header)" "$$(go generate schema/generate.go)" > schema/fs.go

.PHONY: openapi
openapi:
	jsonnet -o openapi/openapi.json openapi/openapi.libsonnet
