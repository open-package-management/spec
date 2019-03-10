// Copyright © 2019 Open Package Management Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package schema

import (
	"strings"

	"github.com/xeipuuv/gojsonschema"
)

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
