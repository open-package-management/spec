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

local namespace = {
  name: 'namespace-foo',
  storageLimit: 548298572358,
  storageUsed: 580324752,
  repoLimit: 100,
  repoCount: 23,
  status: 'ACTIVE',
  labels: {
    team: 'team-foo',
    manager: 'Tom Ripen',
    costCenter: 'cs-foo',
  },
};

local createNamespace = {
  repoLimit: 100,
  storageLimit: 100000000000,
  labels: {
    team: 'team-foo',
    manager: 'Tom Ripen',
    costCenter: 'cs-foo',
  },
};

local listNamespaces = {
  namespaces: [
    {
      name: 'namespace-foo',
      storageLimit: 548298572358,
      storageUsed: 580324752,
      repoLimit: 100,
      repoCount: 23,
      status: 'ACTIVE',
      labels: {
        team: 'team-foo',
        manager: 'Tom Ripen',
        costCenter: 'cs-foo',
      },
    },
    {
      name: 'namespace-bar',
      storageLimit: 850834823484,
      storageUsed: 584920542,
      repoLimit: 200,
      repoCount: 74,
      status: 'ACTIVE',
      labels: {
        team: 'team-bar',
        manager: 'Frank Cousins',
        costCenter: 'cs-bar',
      },
    },
  ],
};

{
  namespace:: namespace,
  createNamespace:: createNamespace,
  listNamespaces:: listNamespaces,
}
