local ns = import 'namespace.libsonnet';
local p = import 'project.libsonnet';
local r = import 'repository.libsonnet';

local namespaceFiles = {
  'namespace/single.schema.json': ns.namespace.schema('jsonschema'),
  'namespace/single.example.json': ns.namespace.example,

  'namespace/create.schema.json': ns.namespaceCreate.schema('jsonschema'),
  'namespace/create.example.json': ns.namespaceCreate.example,

  'namespace/list.schema.json': ns.namespaceList.schema('jsonschema'),
  'namespace/list.example.json': ns.namespaceList.example,
};

local projectFiles = {
  'project/single.schema.json': p.project.schema('jsonschema'),
  'project/single.example.json': p.project.example,

  'project/create.schema.json': p.projectCreate.schema('jsonschema'),

  'project/list.schema.json': p.projectList.schema('jsonschema'),
};

local repositoryFiles = {
  'repository/single.schema.json': r.repository.schema('jsonschema'),
  'repository/single.example.json': r.repository.example,

  'repository/create.schema.json': r.repositoryCreate.schema('jsonschema'),

  'repository/list.schema.json': r.repositoryList.schema('jsonschema'),
};

local allFiles = namespaceFiles + projectFiles + repositoryFiles;

allFiles
