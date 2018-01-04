# planetbot

## Getting Started

Welcome! To get started on development:

### Slack - we use Slack for communication:
+ Sign up for Code for San Francisco Slack https://sfbrigade.slack.com
+ Join #planetbot

### AWS - we use Lex, Lambda etc.
+ Ask Senthil (me@sent-hil.com) for AWS access and credentials
+ Once you’ve access, you can log into: https://097545936362.signin.aws.amazon.com/console
+ Install Brew from https://brew.sh (optional)
+ Install AWS CLI: `brew install awscli`
+ Configure AWS CLI with `aws configure` (you'll be given credentials with AWS access)

### Golang (optional)
We use GoLang for writing lambda functions. If you’ve Go already installed you don’t need the following:
+ Install Brew from https://brew.sh
+ `$ brew install golang`

### Docker - it’s used for the AWS Lambda Go shim
+ Go to https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac to install Docker for OSX

### Clone the repo:
+ `$ go get -u github.com/sfbrigade/planetbot`

### Install Lambda Shim
Below are the two commands from [these instructions](https://github.com/eawsy/aws-lambda-go-shim#quick-hands-on) you'll need to perform:
+ `$ docker pull eawsy/aws-lambda-go-shim:latest`
+ `$ go get -u -d github.com/eawsy/aws-lambda-go-core/...`

### Build
This'll build the zip file that you can upload to AWS Lambda
+ `$ make`

### Links
+ https://console.aws.amazon.com/lambda/home?region=us-east-1#/functions/baaqmpd?tab=graph
+ https://console.aws.amazon.com/lex/home?region=us-east-1#bots:

## Development

There are helpers in Makefile to create, upload and invoke the lambda code.

+ To begin, let's create a lambda function: `make lambda-create`
+ Then run `make update` to upload the code and invoke it.

From now after you make changes to the Go code, then can just run `make update` to upload the code and invoke it from command line.
