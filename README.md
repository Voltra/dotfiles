# dotfiles
> A list of dotfiles and scripts for UNIX environments



## Installation guide

If you don't plan on modifying anything you can use symlinks instead of copies.

### Home files

The files listed below are to be copied/moved (or their content pasted) in the home directory `~` :

* `.bashrc`
* `.vimrc`
* `.bash_aliases`



### Bash folders

The directories listed below are to be moved in the `~/.bash` directory :

* `scripts`
* `installers`

### Config files

The files in the directory `configs` are to be copied into `~/.config`


### Customization

You must adapt a few aliases to your platform, these are :

* `explorer` which allows to open the GUI for the FS (first argument should be a directory)
* `clipboard` which allows to copy content from a pipe directly to the clipboard



You may change the contents of these variables for more setup when your terminal boots :

* `scripts` in `.bash_aliases`
* `installers` in `.bashrc` (**WARNING :** Most of them require `sudo`)

### Complete installation

Once all files are in place, run the following command to finalize the installation :

```bash
sudo ~/.bash/installers/essentials.sh 1> /dev/null
source ~/.bashrc
```

Note that the `essentials` installer script must be ran once, as it requires `sudo` to complete its tasks.
