# awfulwoman.com

This is the static site generator for my personal website, [awfulwoman.com](https://awfulwoman.com).

It's made available to the wider public via [this Ansible role](https://github.com/awfulwoman/infra/tree/main/ansible/roles/script-share-personal-site).

## Things to do before using this

Install the basics.

```sh
brew install pre-commit exiftools hugo
```

Setup the pre-commit hooks.

```sh
pre-commit install
```


## Running

Dev server.

```sh
 hugo server --disableFastRender -w
```