// Copyright © 2019 Titan Distribution Authors
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

type MediaType string

const (
	MediaTypeNamespace        MediaType = "application/vnd.opm.namespace.v1+json"
	MediaTypeNamespaceCreate  MediaType = "application/vnd.opm.namespace.create.v1+json"
	MediaTypeNamespaceList    MediaType = "application/vnd.opm.namespace.list.v1+json"
	MediaTypeProject          MediaType = "application/vnd.opm.project.v1+json"
	MediaTypeProjectCreate    MediaType = "application/vnd.opm.project.create.v1+json"
	MediaTypeProjectList      MediaType = "application/vnd.opm.project.list.v1+json"
	MediaTypeRepository       MediaType = "application/vnd.opm.repository.v1+json"
	MediaTypeRepositoryCreate MediaType = "application/vnd.opm.repository.create.v1+json"
	MediaTypeRepositoryList   MediaType = "application/vnd.opm.repository.list.v1+json"
	MediaTypeTag              MediaType = "application/vnd.opm.tag.v1+json"
)
