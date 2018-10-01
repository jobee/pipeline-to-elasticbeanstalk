# Deploy to AWS ElasticBeanstalk using Bitbucket Pipelines

Docker image and description how to use Bitbucket Pipelines to deploy to AWS ElasticBeanstalk applications.

Basic usage
-------

1.) Create an AWS ElasticBeanstalk application and environment

2.) Create an IAM User
- Attach the policy `AWSElasticBeanstalkFullAccess` (Permissions/Attach Policy)
- Create an access key (Security Credentials/Create Access Key)

3.) Add environment variables to the Bitbucket repository pipelines settings

| Variable name         | Value (Examples)     | Comment                                                            |
| --------------------- | -------------------- | ------------------------------------------------------------------ |
| AWS_ACCESS_KEY_ID     | AIUXIHOEPBRD4TRC74WA | from IAM User credentials                                          |
| AWS_SECRET_ACCESS_KEY | xxxxxx (use the `secured` pipelines env var option) | from IAM User credentials           |
| AWS_REGION            | eu-central-1         | AWS Region you have choosen for your ElasticBeanstalk application  |
| APPLICATION_NAME      | testapp              | ElasticBeanstalk application name                                  |
| APPLICATION_ENV       | testapp-env          | ElasticBeanstalk application environment                           |


4.) Add a `bitbucket-pipelines.yml` file to your Bitbucket repository

```yaml
# filename: bitbucket-pipelines.yml

image: jobee/pipeline-to-elasticbeanstalk

pipelines:
  default:
    - step:
        script:
          - sh /eb-init.sh
          - eb deploy <ElasticBeanstalk environment name you like to deploy to>
```

License
-------

Licensed under MIT, see [LICENSE](LICENSE)
