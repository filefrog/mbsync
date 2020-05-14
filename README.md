filefrog/mbsync
===============

This image provides `mbsync` (part of isync) for synchronizing
email mailboxes, to and from remote IMAP4 accounts and local
Maildir stores.  Use it to back up your email.  Use it to transfer
your email.  HMaybe do both!

[See it on Docker Hub!][1]


Running it on Docker
--------------------

To run this in your local Docker daemon:

    docker run --rm -it filefrog/mbsync --help

This will print out the usage.  You can't do much without a config
file, so you probably want to mount that in via a volume bind:

    docker run --rm -it \
      -v mbsyncrc:/root/.mbsyncrc:ro \
      filefrog/mbsync --verbose some-channel

Also keep in mind, especially for local backups, that the
container filesystem is _ephemeral_, so you normally need to mount
in a volume for _that_ to.  Where in the container you mount that
depends entirely on your `mbsyncrc` configuration.

    docker run --rm -it \
      -v mbsyncrc:/root//mbsyncrc:ro \
      -v /path/to/persistent/store:/store \
      filefrog/mbsync --verbose some-channel

Assuming that the `mbsyncrc` file makes reference to local
filesystem storage under `/store`.


Building (and Publishing) to Docker Hub
---------------------------------------

The Makefile handles building pushing.  For jhunt's:

    make push

Is all that's needed for release.  If you want to build it
locally, you can instead use:

    make build

If you want to tag it to your own Dockerhub username:

    IMAGE=you-at-dockerhub/mbsync make build push

By default, the image is tagged `latest`.  You can supply your own
tag via the `TAG` environment variable:

   IMAGE=... TAG=$(date +%Y%m%d%H%M%S) make build push

Happy Hacking!


[1]: https://hub.docker.com/r/filefrog/mbsync
