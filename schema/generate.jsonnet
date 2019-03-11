local common = import 'common.libsonnet';
local ns = import 'namespace.libsonnet';
local p = import 'project.libsonnet';
local r = import 'repository.libsonnet';
local t = import 'tag.libsonnet';

local namespaceFiles = {
  'namespace/namespace.single.schema.json': ns.namespace.schema(common.jsonschema),
  'namespace/namespace.single.example.json': ns.namespace.example,

  'namespace/namespace.create.schema.json': ns.namespaceCreate.schema(common.jsonschema),
  'namespace/namespace.create.example.json': ns.namespaceCreate.example,

  'namespace/namespace.list.schema.json': ns.namespaceList.schema(common.jsonschema),
  'namespace/namespace.list.example.json': ns.namespaceList.example,
};

local projectFiles = {
  'project/project.single.schema.json': p.project.schema(common.jsonschema),
  'project/project.single.example.json': p.project.example,

  'project/project.create.schema.json': p.projectCreate.schema(common.jsonschema),
  'project/project.create.example.json': p.projectCreate.example,

  'project/project.list.schema.json': p.projectList.schema(common.jsonschema),
  'project/project.list.example.json': p.projectList.example,
};

local repositoryFiles = {
  'repository/repository.single.schema.json': r.repository.schema(common.jsonschema),
  'repository/repository.single.example.json': r.repository.example,

  'repository/repository.create.schema.json': r.repositoryCreate.schema(common.jsonschema),
  'repository/repository.create.example.json': r.repositoryCreate.example,

  'repository/repository.list.schema.json': r.repositoryList.schema(common.jsonschema),
  'repository/repository.list.example.json': r.repositoryList.example,
};

local tagFiles = {
  'tag/tag.single.schema.json': t.tag.schema(common.jsonschema),
  'tag/tag.single.example.json': t.tag.example,

  'tag/tag.create.schema.json': t.tagCreate.schema(common.jsonschema),
  'tag/tag.create.example.json': t.tagCreate.example,

  'tag/tag.list.schema.json': t.tagList.schema(common.jsonschema),
  'tag/tag.list.example.json': t.tagList.example,
};

local allFiles = namespaceFiles + projectFiles + repositoryFiles + tagFiles;

allFiles
