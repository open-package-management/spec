package schema

import (
	//	"fmt"
	"io/ioutil"
	"os"
	"testing"

	"github.com/xeipuuv/gojsonschema"
)

type testParams struct {
	file   string
	valid  bool
	schema func() *gojsonschema.Schema
}

var namespaceTestTable = []testParams{
	{"namespace/namespace.example.json", true, namespace},
	{"namespace/namespace.create.example.json", true, namespaceCreate},
	{"namespace/namespace.list.example.json", true, namespaceList},
}

func TestSchemas(t *testing.T) {
	schemaTables := [][]testParams{
		namespaceTestTable,
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
				schema := tc.schema()
				res, err := schema.Validate(loader)
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
