Capistrano Drupal Multi Environment Deployment
==============================================

The purpose of this project is to utilize capistrano with shell scripts for the
management of your Drupal application from dev to test/staging to production. 
It provides the following tasks:

- Deploy new codebase (and database updates)
- Rollback codebase (and database) to last snapshot
- Synchronize database between environments
- Synchronize uploaded files (public and private) between environments
- Run updates
- Run cron
- Run cache loading (utilizes http://drupal.org/project/drush_ecl)
- Clear caches

The project utilizes drush to run various tasks (and to make many tasks,
particularly synchronization, much easier). So you will need to download
drush from http://drupal.org/project/drush (utilize pecl for the easiest
approach).

The files that you *will* need to edit:

1. aliases.drushrc.php - This is the drupal aliases file. You will, 
specifically, want to edit where to find the application, the server(s) on which
it can access the site, along with the path to the private files directory.
This will reside in your server user's .drush directory.
2. integration/config/deploy/dev (staging and production) - These files specify
to capistrano on where it can find the application, the servers, the username 
to ssh into the server, along with the repository and various other details.

If your site is only on 2 servers, you can remove whichever deployment environment 
makes least sense (and similarly if you only have a production environment - get
rid of the other 2. You can also add more environments though this will also
require updating integration/config/deploy.rb of the names of the new stages / removing
the stages that are in that file.

You can also add/remove any tasks as you see fit. The main file you will want this in is
integration/Capfile (where you can see all the tasks)

You can either run the tasks within integration directly by providing the ```ENVIRONMENT```:

	'cap <ENVIRONMENT> <NAMESPACE:TASK>'

Or use the shell scripts which have this set up already
	'bash /path/to/task.sh <ENVIRONMENT>'
	
For synchronization tasks, you provide ```ENVIRONMENT 2``` so that the ```ENVIRONMENT 2``` will match what is in ```ENVIRONMENT```:

	'bash /path/to/synch_task.sh <ENVIRONMENT> <ENVIRONMENT 2>' 

or 

	'cap <ENVIRONMENT> drupal:<synch_task_name> -s destination_environment=<ENVIRONMENT 2>'
	

Best of luck!
