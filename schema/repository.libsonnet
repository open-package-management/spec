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

local common = import 'common.libsonnet';
local type = common.types;

local jid = {
  repo: 'https://openpackages.io/schema/repo',
  createRepo: 'https://openpackages.io/schema/repo-create',
  listRepos: 'https://openpackages.io/schema/repo-list',
};


local repositorySchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.repo,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    name: { type: 'string' },
    namespace: { type: 'string' },
    project: { type: 'string' },
    size: type.uint64,
    package: {
      type: 'object',
      additionalProperties: false,
      properties: {
        type: { type: 'string' },
        icon: { type: 'string' },
        documentation: { type: 'string' },
      },
    },
    labels: type.mapStringString(output),
  },
};

local repositoryExample = {
  name: 'repository-example-foo',
  namespace: 'namespace-example-foo',
  project: 'project-example-foo',
  package: {
    type: 'OCI Image',
    icon: 'https://opencontainers/static/icon-small.png',
    documentation: 'https://github.com/opencontainers/image-spec',
  },

  size: 34252334,
  labels: {
    team: 'team-example',
    maintainer: 'Billy Seiken',
    costCenter: 'cs-foo',
  },
};

local repositoryCreateSchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.createRepo,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    type: { type: 'string' },
    labels: type.labels(output),
  },
};

local repositoryCreateExample = {
  type: 'OCI Image',
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

local repositoryListSchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.listRepos,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    repositories: {
      type: 'array',
      items: repositorySchemaFunc(''),
    },
  },
};

local repositoryListExample = {
  repositories: [
    {
      name: 'app-foo',
      namespace: 'namespace-foo',
      project: 'project-foo',
      package: {
        type: 'oci-image-v1.0.0',
        icon: 'https://opencontainers/static/icon-small.png',
        documentation: 'https://github.com/opencontainers/image-spec',
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
    },
    {
      name: 'app-bar',
      namespace: 'namespace-foo',
      project: 'project-foo',
      package: {
        type: 'docker-image-v2.2.0',
        icon: 'https://docker.io/static/icon-small.png',
        documentation: 'https://github.com/moby/moby/blob/master/image/spec/v1.2.md',
      },
      labels: {
        provider: {
          awsAccount: 'aws-account-foo',
          pricingPlan: 'PREMIUM',
          region: 'us-east-1',
        },
        consumer: {
          team: 'team-bar',
          manager: 'Tom Ripen',
          costCenter: 'cs-foo',
        },
      },
    },
    {
      name: 'app-foo-helm',
      namespace: 'namespace-foo',
      project: 'project-foo',
      package: {
        type: 'helm-chart-v1.0.0',
        icon: 'https://helm.sh/static/icon-small.png',
        documentation: 'https://helm.sh/docs',
      },
      labels: {
        provider: {
          awsAccount: 'aws-account-foo',
          pricingPlan: 'PREMIUM',
          region: 'us-east-1',
        },
        consumer: {
          team: 'team-helm',
          manager: 'Tom Ripen',
          costCenter: 'cs-foo',
        },
      },
    },
  ],
};

{
  repository:: {
    schema:: repositorySchemaFunc,
    example:: repositoryExample,
  },
  repositoryCreate:: {
    schema:: repositoryCreateSchemaFunc,
    example:: repositoryCreateExample,
  },
  repositoryList:: {
    schema:: repositoryListSchemaFunc,
    example:: repositoryListExample,
  },
}
