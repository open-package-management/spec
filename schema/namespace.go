package schema

import (
	"github.com/xeipuuv/gojsonschema"
)

func namespace() *gojsonschema.Schema {
	path := "namespace/namespace.schema.json"
	mediaType := MediaTypeNamespace
	return load(path, mediaType)
}

func namespaceCreate() *gojsonschema.Schema {
	path := "namespace/namespace.create.schema.json"
	mediaType := MediaTypeNamespaceCreate
	return load(path, mediaType)
}

func namespaceList() *gojsonschema.Schema {
	path := "namespace/namespace.list.schema.json"
	mediaType := MediaTypeNamespaceList
	return load(path, mediaType)
}
