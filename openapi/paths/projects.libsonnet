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

local schema = import '../../schema/project/project.libsonnet';
local params = import '../parameters.libsonnet';

local mediaType = {
  project:: 'application/vnd.open-package-management.project.v1+json',
  createProject:: 'application/vnd.open-package-management.project-create.v1+json',
  listProjects:: 'application/vnd.open-package-management.project-list.v1+json',
};

local getProject = {
  tags: ['projects'],
  operationId: 'getProject',
  parameters: [
    params.namespace,
    params.project,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.project]: {
          schema: schema.project('openapi'),
          //          example: example.namespace,
        },
      },
    },
  },
};

local putProject = {
  tags: ['projects'],
  operationId: 'putProject',
  parameters: [
    params.namespace,
    params.project,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.createProject]: {
          schema: schema.createProject('openapi'),
          //          example: example.namespace,
        },
      },
    },
  },
};

local deleteProject = {
  tags: ['projects'],
  operationId: 'deleteProject',
  parameters: [
    params.namespace,
    params.project,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local listProjects = {
  tags: ['projects'],
  operationId: 'listProjects',
  parameters: [
    params.namespace,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.listProjects]: {
          schema: schema.listProjects('openapi'),
          //          example: example.namespace,
        },
      },
    },
  },
};

local project = {
  get: getProject,
  put: putProject,
  delete: deleteProject,
};

local projects = {
  get: listProjects,
};

{
  '/namespaces/{namespace}/projects/{project}': project,
  '/namespaces/{namespace}/projects': projects,
}
