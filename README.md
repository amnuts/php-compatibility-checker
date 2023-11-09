This repo provides an easy way to run the [phpcompatibility/php-compatibility](https://github.com/PHPCompatibility/PHPCompatibility) tool against any directory/project without having to update the dependencies there.  This is handy if you have a lot of projects you might need to check for any issues when going to PHP 8.2.

First build the docker image:

```bash
docker build -t php-compatibility-checker .
```

Then you can use the `runon` script to start the the check on the docker container.  The path supplied can be relative or absolute, and works to check that single location for all the PHP files not excluded by the ignore rules in the script:

```bash
./runon.sh ../../path/to/your/php/files
```

or:

```bash
./runon.sh /path/to/your/php/files
```
