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

local openapi = 'openapi';
local jsonschema = 'jsonschema';
local V7 = 'http://json-schema.org/draft-07/schema#';

local jid = {
  namespace: 'https://openpackages.io/schema/namespace',
  createNamespace: 'https://openpackages.io/schema/namespace/namespace-create',
  listNamespaces: 'https://openpackages.io/schema/namespace-list',
};

local uint64 = {
  type: 'integer',
  minimum: 0,
  maximum: 18446744073709551615,
};

local mapStringString(output=jsonschema) = {
  type: 'object',
  [if output == jsonschema
  then 'patternProperties'
  else if output == openapi
  then 'x-patternProperties']: {
    '.{1,}': {
      type: 'string',
    },
  },
};

local namespace(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.namespace,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    name: { type: 'string' },
    storageLimit: uint64,
    storageUsed: uint64,
    repoLimit: uint64,
    repoCount: uint64,
    labels: mapStringString(output),
    status: {
      type: 'string',
      enum: [
        'ACTIVE',
        'TERMINATING',
      ],
    },
  },
};

local createNamespace(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.createNamespace,
  [if output == jsonschema then '$schema']: V7,
  title: 'Create Namespace',
  type: 'object',
  properties: {
    storageLimit: uint64,
    repoLimit: uint64,
    labels: mapStringString(output),
  },
};

local listNamespaces(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.listNamespaces,
  [if output == jsonschema then '$schema']: V7,
  title: 'List Namespaces',
  type: 'object',
  properties: {
    namespaces: {
      type: 'array',
      items: namespace(''),
    },
  },
};

{
  namespace:: namespace,
  createNamespace:: createNamespace,
  listNamespaces:: listNamespaces,
}
