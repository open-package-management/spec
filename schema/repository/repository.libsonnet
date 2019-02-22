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

local descriptor(output=jsonschema) = {

  local mediaType = {
    type: 'string',
    pattern: '^[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}/[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}$',
  },

  local digestSHA256 = {
    properties: {
      digest: {
        pattern: '^sha256:[A-Fa-f0-9]{64}$',
      },
    },
  },

  local digestSHA512 = {
    properties: {
      digest: {
        pattern: '^sha512:[A-Fa-f0-9]{128}$',
      },
    },
  },

  local digest = {
    type: 'string',
    pattern: '^[a-z0-9]+(?:[+._-][a-z0-9]+)*:[a-zA-Z0-9=_-]+$',
  },

  local urls = {
    type: 'array',
    items: {
      type: 'string',
      format: 'uri',
    },
  },

  type: 'object',
  properties: {
    mediaType: mediaType,
    size: types.uint64,
    digest: digest,
    urls: urls,
  },
  required: [
    'size',
    'mediaType',
    'digest',
  ],
  anyOf: [
    digestSHA256,
    digestSHA512,
  ],
};

local repo(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.repo,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    name: { type: 'string' },
    namespace: { type: 'string' },
    project: { type: 'string' },
    type: { type: 'string' },
    tags: {
      type: 'object',
      [if output == jsonschema
      then 'patternProperties'
      else if output == openapi
      then 'x-patternProperties']: {
        '.{1,}': descriptor(output),
      },
    },
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
