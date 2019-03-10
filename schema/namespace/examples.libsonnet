local namespace = {
  name: 'namespace-foo',
  status: 'active',
  quotas: {
    storage: {
      limit: 548298572358,
      used: 580324752,
    },
    repositories: {
      limit: 100,
      used: 23,
    },
    projects: {
      limit: 75,
      used: 14,
    },
  },
  labels: {
    provider: {
      awsAccount: 'aws-account-foo',
      pricingPlan: 'PREMIUM',
      region: 'us-east-1',
    },
    consumer: {
      team: 'team-foo',
      manager: 'Tom Ripen',
      costCenter: 'cs-foo',
    },
  },
};

local createNamespace = {
  repoLimit: 100,
  storageLimit: 100000000000,
  labels: {
    team: 'team-foo',
    manager: 'Tom Ripen',
    costCenter: 'cs-foo',
  },
};

local listNamespaces = {
  namespaces: [
    {
      name: 'namespace-foo',
      storageLimit: 548298572358,
      storageUsed: 580324752,
      repoLimit: 100,
      repoCount: 23,
      status: 'active',
      labels: {
        team: 'team-foo',
        manager: 'Tom Ripen',
        costCenter: 'cs-foo',
      },
    },
    {
      name: 'namespace-bar',
      storageLimit: 850834823484,
      storageUsed: 584920542,
      repoLimit: 200,
      repoCount: 74,
      status: 'active',
      labels: {
        team: 'team-bar',
        manager: 'Frank Cousins',
        costCenter: 'cs-bar',
      },
    },
  ],
};

{
  namespace:: namespace,
  createNamespace:: createNamespace,
  listNamespaces:: listNamespaces,
}
