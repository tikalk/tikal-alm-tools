![Tikal icon](http://tikalk.com/sites/all/themes/sasson/tikal/logo.png)
# CVS2AUTHORS
**Notice:** The migration were tested only on Mac OS, ubuntu & centos.

## Automatic creation of CVS authors file

In order to perform the [CVS2GIT](https://github.com/tikalk/tikal-alm-tools/tree/master/scm-tools/scm-migration/manual/CVS2GIT) migration, you need to provide a text file which includes all CVS users with their full name and email addresses in the following format (one line per user):<br/>
```user = full name <email address>```<br/>Example:<br/>```scm-migration = scm-migration <scm-migration>```<br/>
```bill.gates = Bill Gates <bill.gates.microsoft.com>```<br/>

Please notice that:

* you must include a line for each CVS users (and 'scm-migration' user as well)
* each line must incude the username as in CVS but it is not a must that the full name or email adress will be provided - you can replace it with the username instead.

The CVS2AUTHORS script creates a text file with a line-per-user which you can then edit and replace the user name with the full name and email address.<br/>For example, the script creates this line automatically:<br/>```bill.gates = bill.gates <bill.gates>```<br/>so after it is being created you need to check your active directory and replace the full name and email address manually so it will becase:<br/>```bill.gates = Bill Gates <bill.gates.microsoft.com>```


For running the CVS2AUTHORS script, follow those instructions:

## CVS2AUTHORS script prerequisites

**Tool** | **Description** | **Installation**
------------ | ------------- | ------------
**TIKAL-ALM-TOOLS** | This tool should be downloaded to the machine as well using a common git clone command | ```git clone https://github.com/tikalk/tikal-alm-tools.git```
## CVS2AUTHORS script arguments
**Argument** | **Description** | **Value example**
------------ | ------------- | ------------
**repository.name** | The name of the repository as in CVS | tikal-alm-tools
**authors.file.path** | Full path to authors file to be created | /Users/scmMigration/authors-file.txt
**cvs.repository.root** | Path to the root of the CVS repository (can be a local copy of it and should not inlcude the specific repository name as set in the repository.name argument) | http://cvsserver/cvsrepo
## CVS2AUTHORS script activation
Once you're ready will all prerequisites and script arguments, you can activate the CVS2AUTHORS script by running the [/tikal-alm-tools/scm-tools/scm-migration/scripts/scm-migration.xml](https://github.com/tikalk/tikal-alm-tools/blob/master/scm-tools/scm-migration/scripts/scm-migration.xml) ANT script in one of those methods:

1. ```ant -file scm-migration.xml <*list of arguments*> scm-migration:build-draft-cvs-authors-file```<br/>Where <*list of arguments*> is a list of **ALL** the above arguments with there values including leading -D prefix for each argument.<br/>Example:<br/>```ant -file scm-migration -Drepository.name=tikal-alm-tools ... -Dcvs.repository.root=http://cvsserver/cvsrepo scm-migration:build-draft-cvs-authors-file```

2. ```ant -file scm-migration.xml -propertyfile <*path to arguments properties file*> scm-migration:build-draft-cvs-authors-file```<br/>Where <*path to arguments properties file*> is a path of a properties file that include lines for **ALL** the above arguments with there values.<br/>Example:<br/>```ant -file scm-migration -propertyfile ~/CVS2AUTHORS.properties scm-migration:build-draft-cvs-authors-file```
 

 


