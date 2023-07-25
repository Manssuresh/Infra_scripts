cp -r /var/lib/jenkins jenkins_backup_"$current_datetime"/
tar -cvzf jenkins_backup_"$current_datetime".tgz jenkins_backup_"$current_datetime"/
rm -rf jenkins_backup_"$current_datetime"/

  */2 * * * * root sh jenkins_backup.sh
