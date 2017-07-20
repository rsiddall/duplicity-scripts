# Duplicity-based backups

*Status:* this repo is *deprecated*. [Duply](http://duply.net) does a more complete job of wrapping duplicity and allowing you to configure the backup/restore operations with files organized into profiles.  (Duplicity requires you to pass everything on the command line, which requires the use of wrapper scripts for consistency.)

This is a modified set of scripts from https://easyengine.io/tutorials/backups/duplicity-amazon-s3/ mostly to work around hiding the [S3](https://aws.amazon.com/s3/) credentials since duplicity doesn't allow you to pass in a configuration file.

Specific modifications are:

* Use a configuration file to hold the S3 credentials, etc. since all scripts use some or all of the same information

* Use a file to hold the list of folders to include and exclude

* Duplicity can retain backups based on number of full backups instead of just date; now supported

If you have a separate backup program generating tarballs, [s3cmd](http://s3tools.org/s3cmd) can push those to S3.

Note that the configuration files MUST go in /usr/local/etc.  The scripts should go in /usr/local/sbin.

## License

It's not clear what license the original scripts were issued under.  Modifications are MIT-licensed.

