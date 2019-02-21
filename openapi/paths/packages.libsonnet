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

local params = import '../parameters.libsonnet';

local getPackage = {
  tags: ['packages'],
  operationId: 'getPackage',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
    params.package,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local putPackage = {
  tags: ['packages'],
  operationId: 'putPackage',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
    params.package,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local deletePackage = {
  tags: ['packages'],
  operationId: 'deletePackage',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
    params.package,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local listPackages = {
  tags: ['packages'],
  operationId: 'listPackage',
  parameters: [
    params.namespace,
    params.project,
    params.repo,
    params.package,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local package = {
  get: getPackage,
  put: putPackage,
  delete: deletePackage,
};

local packages = {
  get: listPackages,
};

{
  '/namespaces/{namespace}/projects/{project}/repos/{repo}/packages': packages,
  '/namespaces/{namespace}/projects/{project}/repos/{repo}/packages/{package}': package,
}
