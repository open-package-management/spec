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

local schema = import '../../schema/namespace.libsonnet';
local header = import '../headers.libsonnet';
local params = import '../parameters.libsonnet';
local resp = import '../responses.libsonnet';

local mediaType = {
  namespace:: 'application/vnd.open-package-management.namespace.v1+json',
  createNamespace:: 'application/vnd.open-package-management.namespace-create.v1+json',
  listNamespaces:: 'application/vnd.open-package-management.namespace-list.v1+json',
};

local getNamespace = {
  tags: ['namespaces'],
  operationId: 'getNamespace',
  parameters: [params.namespace],
  responses: resp.baseResponses {
    '200': {
      description: 'OK',
      content: {
        [mediaType.namespace]: {
          schema: schema.namespace.schema('openapi'),
          example: schema.namespace.example,
        },
      },
    },
  },
};

local putNamespace = {
  tags: ['namespaces'],
  operationId: 'createNamespace',
  parameters: [params.namespace],
  responses: resp.baseResponses,
  requestBody: {
    required: true,
    content: {
      [mediaType.createNamespace]: {
        schema: schema.namespaceCreate.schema('openapi'),
        example: schema.namespaceCreate.example,
      },
    },
  },
};

local deleteNamespace = {
  tags: ['namespaces'],
  operationId: 'deleteNamespace',
  parameters: [params.namespace],
  responses: resp.baseResponses,
};


local listNamespaces = {
  tags: ['namespaces'],
  operationId: 'listNamespaces',
  parameters: [params.label],
  responses: resp.baseResponses {
    '200': {
      description: 'OK',
      headers: {}
               + header.link,
      content: {
        [mediaType.listNamespaces]: {
          schema: schema.namespaceList.schema('openapi'),
          example: schema.namespaceList.example,
        },
      },
    },
  },
};

local namespace = {
  get: getNamespace,
  put: putNamespace,
  delete: deleteNamespace,
};

local namespaces = {
  get: listNamespaces,
};

{
  '/namespaces': namespaces,
  '/namespaces/{namespace}': namespace,
}
