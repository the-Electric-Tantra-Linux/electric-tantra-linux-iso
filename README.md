# DEPRECATED

I had to go and make it harder on myself, namely switching to Void Linux as the basis of this project(s). This is left up in case others find it useful, or I need it in the future, 

## Introduction
This repository houses all the files necessary to generate an Arch Linux iso file from the profile contained within the iso directory, or `releng`. This profile contains all the necessary files and configurations to build a `liveusb` of the Electric Tantra Linux. It can also serve as a basis for those interested in creating their own Archlinux spin off distribution and can follow along with its general workflow.

## The Name
Its not `Electric Tantra Linux` its **The** `Electric Tantra Linux`. This branding derives from the artisitic side of myself expressed in the tech noir inspired, crappy art I included as the wallpapers. My style is loosely a fusion of south Asian iconography and conceptual motiffs with a dark, cyberpunk inspired look at urban landscapes *throught the looking glass**, which is expressed as the style of the Electric Tantra Linux.

## Why I Did This

> The World Doesn't Need Another Arch Distro, But I Needed One.

- My AwesomeWM config is big and fickle, there is no better way to get a sense of how actually well it performs in an environment that isn't optimized for it

- Makes installing my systems a little more ergonomic, being that its the same environment I will be installing on whatever system I just broke and need to reinstall.

- Learned a lot about package management and the lower level functionality of the Linux system putting it together
    - Repo set up was an especially useful process, beginning with an S3 repo, now all hosted on Github, including writing scripts to automate much of that process
- Need a place to dump the crappy art I make and can exercise the parts of my mind that feel compelled to branding by working on its graphics.

- Linux breaks at the worst times, I need a backup option to quickly get back to a functional system set up for my taste in case it does the Torvalds special on me at a mission critical moment.

- What better way to show off on r/unixporn actually exists? Sure a well laid screenshot is nice (especially with my toy-colorshrooms script) but not as nice or honest as actually being able to run the damn thing on LiveUSB to really get a sense of what I am up to.


## Build Process
I am not using build.sh scripts or bothering with older versions of archiso like many arch-based distros. This is meant to house my dotfiles in an easily reproduced environment, not eat away at my life or function as some Linux activism about bringing back the good old days.

I use `/tmp` to house the work files where the ISO is put together for a more ergonomic cleanup process I can forget about if the build went right as a reboot is all it takes to clear out those files out without worry of forgetting to remove them pre-commit.

To build the ISO, or as the basis for your modifications, just follow the below and everything should be groovy.

```bash
# git clone https://github.com/Thomashighbaugh/electric-tantra-linux-iso
# cd electric-tantra-linux-iso
# mkarchiso -v -w /tmp/mkarchiso-tmp ./releng
```

