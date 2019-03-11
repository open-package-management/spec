local schema = import '../../schema/tag.libsonnet';
local header = import '../headers.libsonnet';
local params = import '../parameters.libsonnet';
local resp = import '../responses.libsonnet';

local mediaType = {
  tag:: 'application/vnd.open-package-management.tag.v1+json',
  tagCreate:: 'application/vnd.open-package-management.tag.create.v1+json',
  tagDelete:: 'application/vnd.open-package-management.tag.delete.v1+json',
};

local tagGet = {
  tags: ['tags'],
  operationId: 'tagGet',
  parameters: [
    params.namespace,
    params.project,
    params.repository,
    params.tag,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.tag]: {
          schema: schema.tag.schema('openapi'),
          example: schema.tag.example,
        },
      },
    },
  },
};

local tagPut = {
  tags: ['tags'],
  operationId: 'tagPut',
  parameters: [
    params.namespace,
    params.project,
    params.repository,
    params.tag,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.tagCreate]: {
          schema: schema.tagCreate.schema('openapi'),
          example: schema.tagCreate.example,
        },
      },
    },
  },
};

local tagDelete = {
  tags: ['tags'],
  operationId: 'tagDelete',
  parameters: [
    params.namespace,
    params.project,
    params.repository,
    params.tag,
  ],
  responses: {
    '200': {
      description: 'OK',
    },
  },
};

local tagList = {
  tags: ['tags'],
  operationId: 'tagList',
  parameters: [
    params.namespace,
    params.project,
    params.repository,
  ],
  responses: {
    '200': {
      description: 'OK',
      content: {
        [mediaType.tagCreate]: {
          schema: schema.tagList.schema('openapi'),
          example: schema.tagList.example,
        },
      },
    },
  },
};

local tag = {
  get: tagGet,
  put: tagPut,
  delete: tagDelete,
};

local tags = {
  get: tagList,
};

{
  '/namespaces/{namespace}/projects/{project}/repositories/{repository}/tags': tags,
  '/namespaces/{namespace}/projects/{project}/repositories/{repository}/tags/{tag}': tag,
}
