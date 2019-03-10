package schema

import (
	"github.com/xeipuuv/gojsonschema"
)

func repository() *gojsonschema.Schema {
	path := "repository/repository.schema.json"
	mediaType := MediaTypeRepository
	return load(path, mediaType)
}

func repositoryCreate() *gojsonschema.Schema {
	path := "repository/repository.create.schema.json"
	mediaType := MediaTypeRepositoryCreate
	return load(path, mediaType)
}

func repositoryList() *gojsonschema.Schema {
	path := "repository/repository.list.schema.json"
	mediaType := MediaTypeRepositoryList
	return load(path, mediaType)
}
