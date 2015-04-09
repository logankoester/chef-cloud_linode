# linode cookbook
> TODO: Enter the cookbook description here.

[![Build Status](http://ci.ldk.io/logankoester/chef-linode/badge)](http://ci.ldk.io/logankoester/chef-linode/)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

## Overview

TODO: Explain the cookbook.

## Installation

Using [Berkshelf](http://berkshelf.com/), add the `linode` cookbook to your Berksfile.

```ruby
cookbook 'linode', github: 'logankoester/chef-linode', branch: 'master'
```
Then run `berks` to install it.

## Usage

TODO: Include usage patterns of any providers or recipes.

### linode::default

Include `linode` in your run_list.

```json
{
  "run_list": [
    "recipe[linode::default]"
  ]
}
```
#
## Running the tests

This cookbook uses the [Foodcritic](http://www.foodcritic.io/) linter, [ChefSpec](http://sethvargo.github.io/chefspec/) for unit testing, and [ServerSpec](http://serverspec.org/) for integration testing via [Test Kitchen](http://kitchen.ci/) with the [kitchen-docker](https://github.com/portertech/kitchen-docker) driver.

It's not as complicated as it sounds, but you will need to have Docker installed.

1. `git clone git@github.com:logankoester/chef-linode.git`
2. `cd chef-linode`
3. `bundle install`
4. `bundle exec rake`

This will run all of the tests once. While developing, run `bundle exec guard start` and the relevant tests will run automatically when you save a file.

## Author

Copyright (c) 2015 [Logan Koester](http://logankoester.com). Released under the mit license. See `LICENSE` for details.
