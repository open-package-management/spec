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

local types = import '../types.libsonnet';

local openapi = 'openapi';
local jsonschema = 'jsonschema';
local V7 = 'http://json-schema.org/draft-07/schema#';

local jid = {
  repo: 'https://openpackages.io/schema/repo',
  createRepo: 'https://openpackages.io/schema/repo-create',
  listRepos: 'https://openpackages.io/schema/repo-list',
};

local repo(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.repo,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    name: { type: 'string' },
    namespace: { type: 'string' },
    project: { type: 'string' },
    labels: types.mapStringString(output),
  },
};

local createRepo(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.createRepo,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    type: { type: 'string' },
    labels: types.mapStringString(output),
  },
};

local listRepos(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.listRepos,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    repositories: {
      type: 'array',
      items: repo(''),
    },
  },
};

{
  repo:: repo,
  createRepo:: createRepo,
  listRepos:: listRepos,
}
