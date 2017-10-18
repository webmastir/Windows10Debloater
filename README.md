# Windows10Debloater
Script/Utility to debloat Windows 10

This script will remove the bloatware from Windows 10, it will create a backup of specific registry keys that are not removed when using Remove-AppXPackage, and then delete those specific registry keys.

It will also first ask you if you want to enable System Restore on your machine, then will create a restore checkpoint if you choose yes, then you will also have the choice to change some privacy settings, such as disabling Cortana and stopping the Feedback Experience.

Alternatively, you can revert changes, which will reinstall all of the bloatware, restore and import the registry keys that were originally exported, and then change the registry keys to re-enable Cortana.
