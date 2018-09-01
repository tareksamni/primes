# Primes table generator

[![CircleCI](https://circleci.com/gh/tareksamni/primes.svg?style=svg)](https://circleci.com/gh/tareksamni/primes)
[![Maintainability](https://api.codeclimate.com/v1/badges/3f293158d55acc67fbf2/maintainability)](https://codeclimate.com/github/tareksamni/primes/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3f293158d55acc67fbf2/test_coverage)](https://codeclimate.com/github/tareksamni/primes/test_coverage)

This is a ruby implementation of Coding Challenge which could be found [here][13].
The code in this repo is mainly divided into small/simple classes and each class own its responsibilities, errors, constants, state and behaviour as follows:

+ [`PrimesGenerator`][1] is responsible for generating N primes.

+ [`Matrix::Calculator`][2] is responsible for calculating a 2D array (matrix) of multiplications of a given set of primes. It's easy to integrate other calculators into the system and switch between them.

+ [`Matrix::Formatter`][3] is responsible for printing any given 2D array as a table to the `STDOUT`. It's easy to integrate other formatter into the system and switch between them.

For ex. you can code a `json` formatter that saves a json format of the table instead of printing it to the `STDOUT`.

This project is following `TDD` so [specs][4] could be found [here][5].

## Setup & Run

This project is using:

+ ruby 2.5.1
+ bundler gem to install all required gems that are listed in [Gemfile][6].
+ rspec gem as the tests framework. Config can be found in [.rspec][7].
+ rubocop gem as a main coding style guide. Config can be found in [.rubocop.yml][8].
+ [Docker][9] to run the application without any dependencies using docker engine.
+ [Codeclimate][12] is used in this project to provide some transparency about the code quality and test coverage.

## Using Docker (Build from source)

[Install Docker Engine][10] on your machine to be able to follow these steps.

run `docker --version` to make sure that docker is installed and running successfully. You should get a message like `Docker version 18.06.1-ce, build e68fc7a`. Now you follow these steps:

+ Build docker image from source

```shell
docker build . -t primes:latest_git_commit_sha
```

where `latest_git_commit_sha` is the git current checked out git commit SHA.

+ Run the application on a docker container

```shell
docker run -it primes:target_git_commit_sha "run"
```

+ Run tests on a docker container

```shell
docker run -it primes:target_git_commit_sha "rspec"
```

## Using Docker (Pull from docker hub)

[Install Docker Engine][10] on your machine to be able to follow these steps.

run `docker --version` to make sure that docker is installed and running successfully. You should get a message like `Docker version 18.06.1-ce, build e68fc7a`. Now you follow these steps:

+ Run the application on a docker container

```shell
docker run -it tareksamni/primes:target_git_commit_sha "run"
```

+ Run tests on a docker container

```shell
docker run -it tareksamni/primes:target_git_commit_sha "rspec"
```

## Without Docker

You need to install the dependencies first, follow these steps to install all required dependencies using [`RVM`][11]:

+ Install RVM

```shell
curl -sSL https://get.rvm.io | bash -s stable
```

+ Install/Use ruby 2.5.1 and create a gemset for this project

```shell
rvm use ruby-2.5.1@primes --create
```

+ Install bundler gem

```shell
gem install bundler
```

+ Install gems listed in Gemfile

```shell
bundle install
```

+ Run application

```shell
run
```

+ Run tests

```shell
rspec
```

[1]: https://github.com/tareksamni/primes
[2]: https://github.com/tareksamni/primes
[3]: https://github.com/tareksamni/primes
[4]: http://rspec.info/
[5]: https://github.com/tareksamni/primes/tree/master/spec
[6]: https://github.com/tareksamni/primes/blob/master/Gemfile
[7]: https://github.com/tareksamni/primes/blob/master/.rspec
[8]: https://github.com/tareksamni/primes/blob/master/.rubocop.yml
[9]: https://www.docker.com/
[10]: https://docs.docker.com/docker-for-mac/install/
[11]: https://rvm.io/rvm/install
[12]: http://codeclimate.com/
[13]: https://github.com/tareksamni/primes/blob/master/CHALLENGE.md