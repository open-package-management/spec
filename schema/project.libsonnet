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
  project: 'https://openpackages.io/schema/project',
  createProject: 'https://openpackages.io/schema/project-create',
  listProjects: 'https://openpackages.io/schema/project-list',
};

local projectSchemaFunc(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.project,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    name: { type: 'string' },
    namespace: { type: 'string' },
    repositories: types.uint64,
    labels: types.labels(output),
  },
};

local projectExample = {
  name: 'project-foo',
  namespace: 'namespace-foo',
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

local projectCreateSchemaFunc(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.createProject,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    labels: types.mapStringString(output),
  },
};

local projectCreateExample = {
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

local projectListSchemaFunc(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.listProjects,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    projects: {
      type: 'array',
      items: projectSchemaFunc(''),
    },
  },
};

local projectListExample = {
  projects: [
    {
      name: 'project-foo',
      namespace: 'namespace-foo',
      repositories: 8,
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
    },
    {
      name: 'project-bar',
      namespace: 'namespace-foo',
      repositories: 5,
      labels: {
        provider: {
          awsAccount: 'aws-account-foo',
          pricingPlan: 'PREMIUM',
          region: 'us-east-1',
        },
        consumer: {
          team: 'team-bar',
          manager: 'Rose Dawson',
          costCenter: 'cs-bar',
        },
      },
    },
  ],
};

{
  project:: {
    schema:: projectSchemaFunc,
    example:: projectExample,
  },
  projectCreate:: {
    schema:: projectCreateSchemaFunc,
    example:: projectCreateExample,
  },
  projectList:: {
    schema:: projectListSchemaFunc,
    example:: projectListExample,
  },
}
