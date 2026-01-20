# DNS

This repository contains [OpenTofu](https://opentofu.org) configurations for my DNS records.

## Repo Layout

The records are declared in the `.tofu` files named after each domain:

- `archess.mn.tofu`
- `eduwoem.org.tofu`
- `moir.xyz.tofu`
- `theshrine.net.tofu`

The two files `main.tf` and `variables.tf` are used for various other bits of configuration. There's also a nix flake because why not.

## CI

CI is run by Jenkins using the devShell in the Nix flake in combination with a custom Jenkins library for running sh steps using the flake. The library can be found over at [archessmn/jenkins-library](https://github.com/archessmn/jenkins-library).

## Backend

As declared in `main.tf`, this terraform config is set up to use [Consul](https://developer.hashicorp.com/consul) as a storage backend for the state files, definitely because I had great reasons for choosing it over all the other options, and definitely **not** because it greatly simplified the amount of work needed to set it up.
