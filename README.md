# Windows10Debloater
Script/Utility to debloat Windows 10

This script will remove the bloatware from Windows 10, it will create a backup of specific registry keys that are not removed when using Remove-AppXPackage, and then delete those specific registry keys.

It will also first ask you if you want to enable System Restore on your machine, then will create a restore checkpoint if you choose yes, then you will also have the choice to change some privacy settings, such as disabling Cortana and stopping the Feedback Experience.

Alternatively, you can revert changes, which will reinstall all of the bloatware, restore and import the registry keys that were originally exported, and then change the registry keys to re-enable Cortana.

# Purpose

I have found many different solutions online to debloat Windows 10 and many either worked but caused issues in the long run, or they did so little that it wasn't enough of a "debloat" experience. I decided to create a script that will debloat Windows 10 the way that I envision it, with the option of even being able to revert changes.

This can help wipe out the 3rd party apps and to stop them from returning.
