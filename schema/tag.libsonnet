local type = import 'types.libsonnet';

local jid = {
  tag:: 'https://openpackages.io/schema/tag',
};

local descriptor(output=type.jsonschema) = {
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
  additionalProperties: false,
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

local tagSchemaFunc(output=type.jsonschema) = {
  [if output == type.jsonschema then '$id']: jid.tag,
  [if output == type.jsonschema then '$schema']: type.jsonschemaV7,
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

{
  tag:: {
    schema:: tagSchemaFunc,
    example:: tagExample,
  },
}
