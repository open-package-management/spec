local ns = import 'namespace.libsonnet';
local p = import 'project.libsonnet';
local r = import 'repository.libsonnet';
local t = import 'tag.libsonnet';

local namespaceFiles = {
  'namespace/namespace.schema.json': ns.namespace.schema('jsonschema'),
  'namespace/namespace.example.json': ns.namespace.example,

  'namespace/namespace.create.schema.json': ns.namespaceCreate.schema('jsonschema'),
  'namespace/namespace.create.example.json': ns.namespaceCreate.example,

  'namespace/namespace.list.schema.json': ns.namespaceList.schema('jsonschema'),
  'namespace/namespace.list.example.json': ns.namespaceList.example,
};

local projectFiles = {
  'project/project.schema.json': p.project.schema('jsonschema'),
  'project/project.example.json': p.project.example,

  'project/project.create.schema.json': p.projectCreate.schema('jsonschema'),

  'project/project.list.schema.json': p.projectList.schema('jsonschema'),
};

local repositoryFiles = {
  'repository/repository.schema.json': r.repository.schema('jsonschema'),
  'repository/repository.example.json': r.repository.example,

  'repository/repository.create.schema.json': r.repositoryCreate.schema('jsonschema'),

  'repository/repository.list.schema.json': r.repositoryList.schema('jsonschema'),
};

local tagFiles = {
  'tag/tag.example.json': t.tag.example,
};

local allFiles = namespaceFiles + projectFiles + repositoryFiles + tagFiles;

allFiles
