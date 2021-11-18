### Requirements: 
1) Vagrant and Vagrant-SSHFS

How to install:

Ubuntu:  
`sudo apt install vagrant vagrant-sshfs`  

Fedora:  
`sudo dnf install vagrant vagrant-sshfs`  

Arch Linux:  
`sudo pacman -S vagrant`

2) VirtualBox

Note: needed due to issues with libvirt.
For installation instructions, refer to your distribution's documentation.

### Building Instructions:

Set up Vagrant instance:
```
git clone --recurse-submodules https://github.com/lutris/vagrant-builder  
cd vagrant-builder 
VAGRANT_DEFAULT_PROVIDER=virtualbox vagrant up  
```
You may need to run `VAGRANT_DEFAULT_PROVIDER=virtualbox vagrant up` twice since it may ask to install vagrant-sshfs the first time.

To build wine, run:
```
./makebuild.sh <name> <version> <winerepo> <branch>
```
where `<name> <version> <winerepo> <branch>` are parameters.

Example: `./makebuild.sh lutris 6.10-7 https://github.com/lutris/wine lutris-6.10-7`  

Final build will be placed in `vagrant-builder/vagrant_share/` in a `wine-name-branch-x86_64.tar.xz` name format.
For example: `wine-lutris-6.10-7-x86_64.tar.xz`  

### Build Installation:  

1) Extract contents `wine-name-branch-x86_64.tar.xz` to `/home/USERNAME/.local/share/lutris/runners/wine/`.  
*Note: Some archive manager may place the contents of an archive inside an additonal parent folder.
For example, Nautilus will place contents of `wine-lutris-6.10-7-x86_64.tar.xz`, which is the folder called `lutris-6.10-7-x86_64`, inside the parent `wine-lutris-6.10-7-x86_64` folder.
You need to copy the folder *inside* it, `lutris-6.10-7-x86_64`, not the parent directory.*
2) Restart lutris. You can now choose `wine-name-branch-x86_64` from the runners list in configuration options for any game.  