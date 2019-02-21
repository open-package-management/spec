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

local example = import '../../schema/namespace/golden.libsonnet';
local schema = import '../../schema/repository/repository.libsonnet';
local params = import '../parameters.libsonnet';
local resp = import '../responses.libsonnet';


local mediaType = {
  repo:: 'application/vnd.titan-distribution.repository.v1+json',
};

local getRepo = {
  tags: ['repos'],
  operationId: 'getRepo',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local putRepo = {
  tags: ['repos'],
  operationId: 'putRepo',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
  ],
  responses: resp.baseResponses,
};

local listRepos = {
  tags: ['repos'],
  operationId: 'listRepos',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local repo = {
  get: getRepo,
  put: putRepo,
};

local repos = {
  get: listRepos,
};

{
  '/namespaces/{namespace}/project/{project}/repos': repos,
  '/namespaces/{namespace}/project/{project}/repos/{repo}': repo,
}
