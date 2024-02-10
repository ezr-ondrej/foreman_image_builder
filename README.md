# Foreman Image Builder

:warning: This is POC

Allow building images through a smart proxy with Osbuild composer installed and smart_proxy_image_builder plugin enabled.
Then using Forester project deploys the image to libvirt/Redshift server.

## Installation

1. Install `osbuild-composer` on the target smart-proxy (might be good idea to also install cockpit plugin, as that's easier to use currently)
1. Install forester controller on the target smart-proxy
1. Install smart_proxy_image_builder plugin on the smart-proxy
1. Manual for now: register the systems you want to manage by forester to forester through its cli
1. Configure forester_url in the SmartProxy
1. Install this plugin to foreman
1. :money_with_wings:  Profit! :money_with_wings: 

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins.

Currently not packaged, nor supported via foreman-installer.

## Usage

1. Create a Blueprint (currently does not work, as workaround use cockpit on the SmartProxy)
1. Build image from this Blueprint
1. Sync the image (it gets uploaded from IB storage to forester storage)
1. Deploy this image (it will let you select a system from Forester inventory, so it needs to be there already - see #Installation)
1. :money_with_wings: :money_with_wings: :money_with_wings: Profit! :money_with_wings::money_with_wings: :money_with_wings:

![Build Image](http://i.imgur.com/a/wRB8AiG.gif)

## TODO

* Clean up UX
* Support for creation of Bluprints (already in draft)
* Support for synchronization of Image Builder Sources (repositories)
* Synchronize images automatically to forester
  * extra points: allow synchronizing images with dynflow to pulp - would need Forester support
* Bake autoregistration into the image, add this as full "New host" workflow
* Share Compute resource with forester, or figure out the workflow to manage forester's appliances (compute resources)


## Contributing

Fork and send a Pull Request or file an Issue. Thanks! :orange_heart:

## Copyright

Copyright (c) 2024 Ondrej Ezr

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

