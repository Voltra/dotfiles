# dotfiles
> A list of dotfiles and scripts for UNIX environments



## Installation guide

### Home files

The files listed below are to be copied/moved (or their content pasted) in the home directory `~` :

* `.bashrc`
* `.vimrc`
* `.bash_aliases`



### Bash folders

The directories listed below are to be moved in the `~/.bash` directory :

* `scripts`
* `installers`



### Customization

You may change the contents of these variables for more setup when your terminal boots :

* `scripts` in `.bash_aliases`
* `installers` in `.bashrc` (**WARNING :** Most of them require sudo)

### Complete installation

Once all files are in place, run the following command to finalize the installation :

```bash
source ~/.bashrc && ~/.bash/installers/essentials.sh
```

Note that the `essentials` installer script must be run once, as it requires `sudo` to complete its tasks.