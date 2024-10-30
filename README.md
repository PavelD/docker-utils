# docker-utils

Repository with miscelous docker utils.

## List of utils

### composite docker-compose

I split my services into different directories. For management I was using following alias for long time already.

```
alias docker-compose='docker-compose $(for file in `find . -name docker-compose.yml`; do echo "-f $file "; done)'
```

But I had to go to the / of my docker-compose tree every time I run docker-compose command. Short extension of the original alias helped me and now command is working from any directory with docker-compose.yaml file as well as from the root directory with no docker-compose.yml file.

curretly I put new script on my $PATH and create simple alias.

```
alias docker-compose='docker-compose.sh'
```

### find dependent child images

During cleanup on my docker host and found some old alpine base images with unknown dependend child. I was trying several tools and scripts but all fails in one specific case. Thats why I created this small script with recursion.

*Problem:*
```
$ docker rmi 9c6f07244728
Error response from daemon: conflict: unable to delete 9c6f07244728 (cannot be forced) - image has dependent child images
```
*Solution:*
```
pavel@gto:~$ find_child.sh 9c6f07244728
paveld/custom-image            latest            0b3d9c3e8055   17 months ago   75.2MB
```
