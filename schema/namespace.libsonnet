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

local types = import 'types.libsonnet';

local openapi = 'openapi';
local jsonschema = 'jsonschema';
local V7 = 'http://json-schema.org/draft-07/schema#';

local jid = {
  namespace: 'https://openpackages.io/schema/namespace',
  createNamespace: 'https://openpackages.io/schema/namespace-create',
  listNamespaces: 'https://openpackages.io/schema/namespace-list',
};

local quotaDescriptor(output=jsonschema) = {
  type: 'object',
  additionalProperties: false,
  properties: {
    limit: types.uint64,
    used: types.uint64,
  },
};

local labels(output=jsonschema) = {
  type: 'object',
  additionalProperties: false,
  properties: {
    provider: types.mapStringString(output),
    consumer: types.mapStringString(output),
  },
};

local namespaceSchemaFunc(output=jsonschema) = {
  local quotas = {
    type: 'object',
    additionalProperties: false,
    properties: {
      storage: quotaDescriptor(output),
      projects: quotaDescriptor(output),
      repositories: quotaDescriptor(output),
    },
  },

  [if output == jsonschema then '$id']: jid.namespace,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  additionalProperties: false,
  properties: {
    name: { type: 'string' },
    quotas: quotas,
    labels: labels(output),
    status: {
      type: 'string',
      enum: ['active', 'terminating'],
    },
  },
};

local namespaceExample = {
  name: 'namespace-foo',
  status: 'active',
  quotas: {
    storage: {
      limit: 548298572358,
      used: 580324752,
    },
    repositories: {
      limit: 100,
      used: 23,
    },
    projects: {
      limit: 75,
      used: 14,
    },
  },
  labels: {
    provider: {
      awsAccount: 'aws-account-foo',
      pricingPlan: 'PREMIUM',
      region: 'us-east-1',
    },
    consumer: {
      team: 'team-foo',
      manager: 'Tom Ripen',
      costCenter: 'cs-foo',
    },
  },
};

local namespaceCreateSchemaFunc(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.createNamespace,
  [if output == jsonschema then '$schema']: V7,
  title: 'Create Namespace',
  type: 'object',
  additionalProperties: false,
  properties: {
    storageLimit: types.uint64,
    repoLimit: types.uint64,
    labels: types.mapStringString(output),
  },
};

local namespaceCreateExample = {
  repoLimit: 100,
  storageLimit: 100000000000,
  labels: {
    team: 'team-foo',
    manager: 'Tom Ripen',
    costCenter: 'cs-foo',
  },
};

local namespaceListSchemaFunc(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.listNamespaces,
  [if output == jsonschema then '$schema']: V7,
  title: 'List Namespaces',
  type: 'object',
  additionalProperties: false,
  properties: {
    namespaces: {
      type: 'array',
      items: namespaceSchemaFunc(''),
    },
  },
};

local namespaceListExample = {
  namespaces: [
    {
      name: 'namespace-foo',
      status: 'active',
      quotas: {
        storage: {
          limit: 5092847552234,
          used: 802833443,
        },
        repositories: {
          limit: 100,
          used: 23,
        },
        projects: {
          limit: 75,
          used: 14,
        },
      },
      labels: {
        provider: {
          awsAccount: 'aws-account-foo',
          pricingPlan: 'premium',
          region: 'us-east-1',
        },
        consumer: {
          team: 'team-foo',
          manager: 'Tom Ripen',
          costCenter: 'cs-foo',
        },
      },
    },
    {
      name: 'namespace-bar',
      status: 'active',
      quotas: {
        storage: {
          limit: 2239424948849,
          used: 85224342,
        },
        repositories: {
          limit: 50,
          used: 4,
        },
        projects: {
          limit: 10,
          used: 1,
        },
      },
      labels: {
        provider: {
          awsAccount: 'aws-account-bar',
          pricingPlan: 'free',
          region: 'us-east-1',
        },
        consumer: {
          team: 'team-bar',
          manager: 'Frank Cousins',
          costCenter: 'cs-bar',
        },
      },
    },
  ],
};

{
  namespace:: {
    schema:: namespaceSchemaFunc,
    example:: namespaceExample,
  },
  namespaceCreate:: {
    schema:: namespaceCreateSchemaFunc,
    example:: namespaceCreateExample,
  },
  namespaceList:: {
    schema:: namespaceListSchemaFunc,
    example:: namespaceListExample,
  },
}
