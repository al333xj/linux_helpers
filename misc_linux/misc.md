# Multiple workspaces and monitors 

When you switch workspaces, all monitors switch

Source: https://askubuntu.com/questions/1059479/dual-monitor-workspaces-in-ubuntu-18-04

Update 2024: You can actually do this in Settings > Multitasking > Workspaces on all displays

```
gsettings set org.gnome.mutter workspaces-only-on-primary false 
```

# Desktop files

Make like this: https://askubuntu.com/questions/281293/creating-a-desktop-file-for-a-new-application

Can use the following command to check it.

```
desktop-file-install THE_DESKTOP_FILENAME_HERE.desktop
```
