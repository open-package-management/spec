local openapi = 'openapi';
local jsonschema = 'http://json-schema.org/draft-07/schema#';

local string = { type: 'string' };

local uint64 = {
  type: 'integer',
  minimum: 0,
  maximum: 18446744073709551615,
};

local mapStringString(output=jsonschema) = {
  type: 'object',
  [if output == jsonschema
  then 'patternProperties'
  else if output == openapi
  then 'x-patternProperties']: {
    '.{1,}': {
      type: 'string',
    },
  },
};

local mapStringObject(output=jsonschema) = {
  type: 'object',
  [if output == jsonschema
  then 'patternProperties'
  else if output == openapi
  then 'x-patternProperties']: {
    '.{1,}': {
      type: 'string',
    },
  },
};

local labels(output=jsonschema) = {
  type: 'object',
  additionalProperties: false,
  properties: {
    provider: mapStringString(output),
    consumer: mapStringString(output),
  },
};

{
  openapi:: openapi,
  jsonschema:: jsonschema,
  types:: {
    uint64:: uint64,
    mapStringString:: mapStringString,
    labels:: labels,
    string:: string,
  },
}
