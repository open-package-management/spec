// Copyright © 2019 Open Package Management Authors
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

local repository = {
  name: 'repository-example-foo',
  namespace: 'namespace-example-foo',
  project: 'project-example-foo',
  package: {
    type: 'OCI Image',
    documentation: 'https://github.com/opencontainers/image-spec',
    icon: 'https://opencontainers/static/icon-small.png',
    clients: {
      exampleCli: {
        command: 'example-cli',
        actions: {
          download: ['download', '--image', '{package}', '--tag', '{tag}'],
          upload: ['upload', '--image', '{package}', '--tag', '{tag}'],
        },
      },
      docker: {
        command: 'docker',
        actions: {
          download: ['pull', '{package}:{tag}'],
          upload: ['push', '{package}:{tag}'],
        },
      },
      skopeo: {
        command: 'skopeo',
        actions: {
          download: ['pull', '{package}:{tag}'],
          upload: ['push', '{package}:{tag}'],
        },
      },
    },
  },

  size: 34252334,
  labels: {
    team: 'team-example',
    maintainer: 'Billy Seiken',
    costCenter: 'cs-foo',
  },
};

{
  repository: repository,
}
