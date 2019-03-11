package schema

import (
	"io/ioutil"
	"os"
	"testing"

	"github.com/xeipuuv/gojsonschema"
)

type testParams struct {
	file      string
	mediaType MediaType
	valid     bool
}

var namespaceTestTable = []testParams{
	{"namespace/namespace.single.example.json", MediaTypeNamespace, true},
	{"namespace/namespace.create.example.json", MediaTypeNamespaceCreate, true},
	{"namespace/namespace.list.example.json", MediaTypeNamespaceList, true},
}

var projectTestTable = []testParams{
	{"project/project.single.example.json", MediaTypeProject, true},
	{"project/project.create.example.json", MediaTypeProjectCreate, true},
	{"project/project.list.example.json", MediaTypeProjectList, true},
}

var repositoryTestTable = []testParams{
	{"repository/repository.single.example.json", MediaTypeRepository, true},
	{"repository/repository.create.example.json", MediaTypeRepositoryCreate, true},
	{"repository/repository.list.example.json", MediaTypeRepositoryList, true},
}

func TestSchemas(t *testing.T) {
	schemaTables := [][]testParams{
		namespaceTestTable,
		projectTestTable,
		repositoryTestTable,
	}

	for _, tt := range schemaTables {
		for _, tc := range tt {
			tf := func(t *testing.T) {
				data, err := os.Open(tc.file)
				if err != nil {
					t.Errorf("unable to open %s: %s", tc.file, err)
				}
				defer data.Close()

				b, err := ioutil.ReadAll(data)
				if err != nil {
					t.Errorf("unable to read data: %s", err)
				}

				loader := gojsonschema.NewBytesLoader(b)
				v := Validator()
				res, err := v[tc.mediaType].Validate(loader)
				if err != nil {
					t.Errorf("unable to validate schema: %s", err)
				}

				if !res.Valid() && tc.valid {
					t.Errorf("expected valid schema, got invalid: %s", res.Errors())
				} else if res.Valid() && !tc.valid {
					t.Errorf("expected invalid schema, got valid")
				}
			}
			t.Run(tc.file, tf)
		}
	}
}
