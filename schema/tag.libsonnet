local common = import 'common.libsonnet';
local type = common.types;

local jid = {
  tag:: 'https://openpackages.io/schema/tag',
  tagCreate:: 'https://openpackages.io/schema/tag-create',
  tagList:: 'https://openpackages.io/schema/tag-list',
};

local descriptor(output=common.jsonschema) = {
  local mediaType = {
    type: 'string',
    pattern: '^[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}/[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}$',
  },

  local digestSHA256 = {
    properties: {
      digest: {
        pattern: '^sha256:[A-Fa-f0-9]{64}$',
      },
    },
  },

  local digestSHA512 = {
    properties: {
      digest: {
        pattern: '^sha512:[A-Fa-f0-9]{128}$',
      },
    },
  },

  local digest = {
    type: 'string',
    pattern: '^[a-z0-9]+(?:[+._-][a-z0-9]+)*:[a-zA-Z0-9=_-]+$',
  },

  local urls = {
    type: 'array',
    items: {
      type: 'string',
      format: 'uri',
    },
  },

  type: 'object',
  properties: {
    mediaType: mediaType,
    size: type.uint64,
    digest: digest,
    urls: urls,
  },
  required: [
    'size',
    'mediaType',
    'digest',
  ],
  anyOf: [
    digestSHA256,
    digestSHA512,
  ],
};

local tagSchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.tag,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    name: type.string,
    namespace: type.string,
    project: type.string,
    repository: type.string,
    manifest: descriptor(output),
  },
};

local tagExample = {
  name: 'v1.0.1',
  namespace: 'namespace-foo',
  project: 'project-foo',
  repository: 'app-foo',
  manifest: {
    mediaType: 'application/vnd.oci.image.manifest.v1+json',
    digest: 'sha256:10b995d6204131069af3e4f00dc1d3758d517a5edb29e5757d3c2858d5613127',
    size: 435,
  },
};

local tagCreateSchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.tagCreate,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    manifest: descriptor(output),
  },
};

local tagCreateExample = {
  manifest: {
    mediaType: 'application/vnd.oci.image.manifest.v1+json',
    digest: 'sha256:10b995d6204131069af3e4f00dc1d3758d517a5edb29e5757d3c2858d5613127',
    size: 435,
  },
};

local tagListSchemaFunc(output=common.jsonschema) = {
  [if output == common.jsonschema then '$id']: jid.tagList,
  [if output == common.jsonschema then '$schema']: common.jsonschema,
  type: 'object',
  additionalProperties: false,
  properties: {
    tags: {
      type: 'array',
      items: tagSchemaFunc(''),
    },
  },
};

local tagListExample = {
  tags: [
    {
      name: 'v1.0.0',
      namespace: 'namespace-foo',
      project: 'project-foo',
      repository: 'app-foo',
      manifest: {
        mediaType: 'application/vnd.oci.image.manifest.v1+json',
        digest: 'sha256:10b995d6204131069af3e4f00dc1d3758d517a5edb29e5757d3c2858d5613127',
        size: 435,
      },
    },
    {
      name: 'v2.0.0',
      namespace: 'namespace-foo',
      project: 'project-foo',
      repository: 'app-foo',
      manifest: {
        mediaType: 'application/vnd.oci.image.manifest.v1+json',
        digest: 'sha256:c12ae6761950c2b151c8274451375781de87aa70a9ccfa6eddd074001c88cf04',
        size: 582,
      },
    },
    {
      name: 'v3.0.0',
      namespace: 'namespace-foo',
      project: 'project-foo',
      repository: 'app-foo',
      manifest: {
        mediaType: 'application/vnd.oci.image.manifest.v1+json',
        digest: 'sha256:fe495acf3d7e84c6370a1b25a2624c4e09184f293a91fdff5915478f2f3bc8a8',
        size: 748,
      },
    },
  ],
};

{
  tag:: {
    schema:: tagSchemaFunc,
    example:: tagExample,
  },
  tagCreate:: {
    schema:: tagCreateSchemaFunc,
    example:: tagCreateExample,
  },
  tagList:: {
    schema:: tagListSchemaFunc,
    example:: tagListExample,
  },
}
