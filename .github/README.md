# the Electric Tantra Linux ISO

To demonstrate my carefully constructed environment to interested third parties, I have cobbled together an arch-based iso file that is a replica of my environment that is easily redistributed and produces the precise environment I intend in virtual machines or on bare metal *just like that*. 

In order to speed up the build times, I have leveraged Docker (inspired by `brinkOS`'s use of Docker primarily) and wrote a wrapper script to enable a single command build process, `create-iso.sh` which interested parties may run to build a local copy of the ISO file on their own systems, regardless if it is Arch based or not thanks to the **power of Docker**. 

## Unique Features 

Plenty of other repos exist of profiles using `mkarchiso` to derive an ISO file, what makes this unique is the following:
    1. Docker based build process - can be run on non-Arch systems the same as on Arch based systems. Faster build times due to caching of build artifacts by Docker.
    2. Separately Hosted Repo - Also reduces build times as the AUR packages don't need to be `git clone`'ed and then built in a local repository at build time. I have already taken care of that and hosted it in a separate repository. 
    3. Extensive customization of GUI - The whole point of building this thing, it features a live variant of my dotfiles, specifically those involving AwesomeWM. Additional configurations exist for zsh, Xresources and a whole lot more. Some of the scripts may be of interest to users, including the beep scripts that I have disabled at boot (unlike locally to irritate my girlfriend :3) 
    4. Custom Branding and Artwork - all of the branding and artwork was also my personal work... and no I don't even have that much free time on my hands. 
    5. Multiple installers - I have included several means of installing Arch on your system pending the completion of my calamares fork that should be able to install this same system locally and in so doing make my life much easier when need for reinstallation arises. Included is `abif` and `archfi`, both of which will provide you with a basic installation of Arch. In the latter case, the script enables the downloading of `archdi` to further install relevant software locally without branding it like the Anarchy Linux installer, which is why I opted to include it. If you have never manually installed Arch, you probably should but once you have a time or two, these sorts of installers make more sense than going through that tedious process again. 


## Caveats
This live demonstration of my environment has some caveats to consider that result from its presence within an easily distributed LiveUSB environment. 
    1. Certain widgets are not present - In order to test the environment out in virtual machines, the battery widget and some of the widgets relating to the sensors had to be culled. 
    2. Software Included - Being that this will function as a rescue environment, there are some additional packages included I don't usually have installed locally. Additionally, some of what I do install locally that is a bit too heavy I have left out of the system for purposes of keeping it reasonable in size.
    3. Fonts - locally I have some absurd number of fonts in varying formats, something to the effect of 15,000 (yeah its crazy) and not wanting to include them all here, I left those out as they make for slow fc-cache commands and laege ISOs
    4. Systemd - originally I intended to use a systemd-free distro to serve as the basis as I had moved to them and enjoyed their use, however either the ISO building tools available were so badly documented as to render my heavily customized environment impossible (or the devs "not in the business of custom ISO consulting") or were based on musl, which prevents me from using software I have need for in my workflow, though am impressed with the speed of. So I moved back to systemd, which to be fair isn't really all that slow once you get the experience of how init systems work by using another for a period of time, but eventally I hope to rebase this project on either Void Linux or Artix (because the AUR is hard to give up even if most software can be installed with a simple "make" then "sudo make install", someone already working that part out is awfully nice). 
    5. Opinionated AwesomeWM Configuration - this is either a positive or a negative depending on your opinions, but as my personal configuration it is a highly opinionated one that suits me and my opinions but may not work so well for you depending on what your opinions are specifically. Too ease this, I have provided a tutorial that annoys the hell out of me debugging the ISO that will indicate how to work with the environment, inspired by TOS' TDE having a similar functionality. This may eventually expand into an entire welcome application, or it may not, we will see. 

## Roadmap

While the finished product with just the AwesomeWM configuration finally situated on the ISO is enough for my use cases, there are a few points I will be addressing when my irritation level with this particular project reduces to the point of being able to work on it again, pull requests welcome, they are:
    - [ ] (medium importance) Move to Artix or Void Linux base 
    - [ ] (high importance) create a means of including the entire configuration's sensors and applets with stand-in values for battery and the sensors if data is not pulled like on a desktop or VM
    - [ ] (low importance) create and then situate a qtile configuration for those days I hate awesome too much 
    - [ ] (lowest importance) same as above except with a gnome extension 