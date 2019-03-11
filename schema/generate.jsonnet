local ns = import 'namespace.libsonnet';
local p = import 'project.libsonnet';
local r = import 'repository.libsonnet';
local t = import 'tag.libsonnet';

local namespaceFiles = {
  'namespace/namespace.single.schema.json': ns.namespace.schema('jsonschema'),
  'namespace/namespace.single.example.json': ns.namespace.example,

  'namespace/namespace.create.schema.json': ns.namespaceCreate.schema('jsonschema'),
  'namespace/namespace.create.example.json': ns.namespaceCreate.example,

  'namespace/namespace.list.schema.json': ns.namespaceList.schema('jsonschema'),
  'namespace/namespace.list.example.json': ns.namespaceList.example,
};

local projectFiles = {
  'project/project.single.schema.json': p.project.schema('jsonschema'),
  'project/project.single.example.json': p.project.example,

  'project/project.create.schema.json': p.projectCreate.schema('jsonschema'),
  'project/project.create.example.json': p.projectCreate.example,

  'project/project.list.schema.json': p.projectList.schema('jsonschema'),
  'project/project.list.example.json': p.projectList.example,
};

local repositoryFiles = {
  'repository/repository.single.schema.json': r.repository.schema('jsonschema'),
  'repository/repository.single.example.json': r.repository.example,

  'repository/repository.create.schema.json': r.repositoryCreate.schema('jsonschema'),
  'repository/repository.create.example.json': r.repositoryCreate.example,

  'repository/repository.list.schema.json': r.repositoryList.schema('jsonschema'),
  'repository/repository.list.example.json': r.repositoryList.example,
};

local tagFiles = {
  'tag/tag.single.example.json': t.tag.example,
};

local allFiles = namespaceFiles + projectFiles + repositoryFiles + tagFiles;

allFiles
