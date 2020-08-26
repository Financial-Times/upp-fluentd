<!--
    Written in the format prescribed by https://github.com/Financial-Times/runbook.md.
    Any future edits should abide by this format.
-->

# Content Fluentd

Fluentd deployment and configuration used to process Content logs.

## Service Tier

Bronze

## Lifecycle Stage

Production

## Delivered By

content

## Supported By

content

## Known About By

- mihail.mihaylov
- donislav.belev
- boyko.boykov
- kalin.arsov
- dimitar.terziev
- hristo.georgiev

## Host Platform

AWS

## Architecture

This service is deamonset running in each cluser and responsible for filtering and collecting all the logs from the services of each cluser. The logs are stored in S3 bucket.

## Contains Personal Data

No

## Contains Sensitive Data

No

## Dependencies

- content-fluentd-stream

## Failover Architecture Type

ActiveActive

## Failover Process Type

FullyAutomated

## Failback Process Type

FullyAutomated

## Failover Details

The service is deployed in all Delivery, Publish and PAC clusters. The failover guides for the clusters can be found here:
<https://github.com/Financial-Times/upp-docs/tree/master/failover-guides>

## Data Recovery Process Type

FullyAutomated

## Data Recovery Details

The data are stored in S3 bucket.

## Release Process Type

PartiallyAutomated

## Rollback Process Type

Manual

## Release Details

Deployed with Jenkins job

## Key Management Process Type

Manual

## Key Management Details

To access the job clients need to provide basic auth credentials to log into the k8s clusters.
To rotate credentials you need to login to a particular cluster and update varnish-auth secrets.

## Monitoring

NotApplicable

## First Line Troubleshooting

<https://github.com/Financial-Times/upp-docs/tree/master/guides/ops/first-line-troubleshooting>

## Second Line Troubleshooting

Please refer to the GitHub repository README for troubleshooting information.
