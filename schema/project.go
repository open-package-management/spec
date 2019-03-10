package schema

import (
	"github.com/xeipuuv/gojsonschema"
)

func project() *gojsonschema.Schema {
	path := "project/project.schema.json"
	mediaType := MediaTypeProject
	return load(path, mediaType)
}

func projectCreate() *gojsonschema.Schema {
	path := "project/project.create.schema.json"
	mediaType := MediaTypeProjectCreate
	return load(path, mediaType)
}

func projectList() *gojsonschema.Schema {
	path := "project/project.list.schema.json"
	mediaType := MediaTypeProjectList
	return load(path, mediaType)
}
