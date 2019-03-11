package schema

import (
	"strings"

	"github.com/xeipuuv/gojsonschema"
)

// Validator validates.
func Validator() map[MediaType]*gojsonschema.Schema {
	vmap := map[MediaType]*gojsonschema.Schema{
		MediaTypeNamespace:       namespaceValidator(),
		MediaTypeNamespaceCreate: namespaceCreateValidator(),
		MediaTypeNamespaceList:   namespaceListValidator(),

		MediaTypeProject:       projectValidator(),
		MediaTypeProjectCreate: projectCreateValidator(),
		MediaTypeProjectList:   projectListValidator(),

		MediaTypeRepository:       repositoryValidator(),
		MediaTypeRepositoryCreate: repositoryCreateValidator(),
		MediaTypeRepositoryList:   repositoryListValidator(),

		MediaTypeTag:       tagValidator(),
		MediaTypeTagCreate: tagCreateValidator(),
		MediaTypeTagList:   tagListValidator(),
	}
	return vmap

}

// schemaFS returns an http.FileSystem containing OPR jsonschemas
var schemaFS = _escFS(false)

func load(file, mediaType string) *gojsonschema.Schema {
	parts := []string{"file:///", file}
	path := strings.Join(parts, "")
	loader := gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
	schema, err := gojsonschema.NewSchema(loader)
	if err != nil {
		panic(err)
	}

	schema.SetRootSchemaName(mediaType)
	return schema
}

func namespaceValidator() *gojsonschema.Schema {
	path := "namespace/namespace.single.schema.json"
	mediaType := string(MediaTypeNamespace)
	return load(path, mediaType)
}

func namespaceCreateValidator() *gojsonschema.Schema {
	path := "namespace/namespace.create.schema.json"
	mediaType := string(MediaTypeNamespaceCreate)
	return load(path, mediaType)
}

func namespaceListValidator() *gojsonschema.Schema {
	path := "namespace/namespace.list.schema.json"
	mediaType := string(MediaTypeNamespaceList)
	return load(path, mediaType)
}

func projectValidator() *gojsonschema.Schema {
	path := "project/project.single.schema.json"
	mediaType := string(MediaTypeProject)
	return load(path, mediaType)
}

func projectCreateValidator() *gojsonschema.Schema {
	path := "project/project.create.schema.json"
	mediaType := string(MediaTypeProjectCreate)
	return load(path, mediaType)
}

func projectListValidator() *gojsonschema.Schema {
	path := "project/project.list.schema.json"
	mediaType := string(MediaTypeProjectList)
	return load(path, mediaType)
}

func repositoryValidator() *gojsonschema.Schema {
	path := "repository/repository.single.schema.json"
	mediaType := string(MediaTypeRepository)
	return load(path, mediaType)
}

func repositoryCreateValidator() *gojsonschema.Schema {
	path := "repository/repository.create.schema.json"
	mediaType := string(MediaTypeRepositoryCreate)
	return load(path, mediaType)
}

func repositoryListValidator() *gojsonschema.Schema {
	path := "repository/repository.list.schema.json"
	mediaType := string(MediaTypeRepositoryList)
	return load(path, mediaType)
}

func tagValidator() *gojsonschema.Schema {
	path := "tag/tag.single.schema.json"
	mediaType := string(MediaTypeRepositoryList)
	return load(path, mediaType)
}

func tagCreateValidator() *gojsonschema.Schema {
	path := "tag/tag.create.schema.json"
	mediaType := string(MediaTypeRepositoryList)
	return load(path, mediaType)
}

func tagListValidator() *gojsonschema.Schema {
	path := "tag/tag.list.schema.json"
	mediaType := string(MediaTypeRepositoryList)
	return load(path, mediaType)
}
