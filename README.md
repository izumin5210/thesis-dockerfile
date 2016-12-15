# Docker image for building thesises
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)][license]

## Setup

Pull the image from [hub.docker.io][dockerhub].

```
$ docker pull izumin5210/thesis
```


## Usage

```
# build a thesis
$ docker run --rm -i -v $(pwd):/data izumin5210/thesis latexmk

# lint a thesis
$ docker run --rm -i -v $(pwd):/data izumin5210/thesis redpen -c <path_to_your_config> **/*.tex
```


## License
Licensed under [MIT License][license].

[license]: https://izumin.mit-license.org/2016
[dockerhub]: https://hub.docker.com/r/izumin5210/thesis/
