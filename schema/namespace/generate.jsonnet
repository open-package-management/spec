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

local example = import 'examples.libsonnet';
local schema = import 'schema.libsonnet';

{
  'namespace.schema.json': schema.namespace(),
  'namespace.example.json': example.namespace,

  'namespace.create.schema.json': schema.createNamespace(),
  'namespace.create.example.json': example.createNamespace,

  'namespace.list.schema.json': schema.listNamespaces(),
  'namespace.list.example.json': example.listNamespaces,
}
