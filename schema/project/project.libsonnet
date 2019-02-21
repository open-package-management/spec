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
  project: 'https://openpackages.io/schema/project',
  createProject: 'https://openpackages.io/schema/project-create',
  listProjects: 'https://openpackages.io/schema/project-list',
};

local project(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.project,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    name: { type: 'string' },
    namespace: { type: 'string' },
    labels: types.mapStringString(output),
  },
};

local createProject(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.createProject,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    labels: types.mapStringString(output),
  },
};

local listProjects(output=jsonschema) = {
  [if output == jsonschema then '$id']: jid.listProjects,
  [if output == jsonschema then '$schema']: V7,
  type: 'object',
  properties: {
    projects: {
      type: 'array',
      items: project(''),
    },
  },
};

{
  project:: project,
  createProject:: createProject,
  listProjects:: listProjects,
}
