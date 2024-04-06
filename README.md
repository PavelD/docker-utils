# docker-utils

Repository with miscelous docker utils.

## List of utils

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
