grails-platform-ui-scaffolding
==============================

Scaffolding templates for use with Grails Platform UI providing themable scaffolding views.


General Information
-------------------

This is an initial attempt to rework the scaffolding templates that are provided with Grails 2.x into the new
platform-ui and core tags.

For information about Platform UI refer to this documentation:
<http://grailsrocks.github.com/grails-platform-ui/>

For information about scaffolding refer to the Official Grails Documentation:
<http://grails.org/doc/latest/guide/single.html#scaffolding>


You still currently need to locate the scaffolding templates in the master projects `/src/templates/scaffolding`. If
you had previously run the grails 'install templates' command, these files may already be there, either way, currently
they will be replaced by these ones.


Requirements
-----
* These templates require the following to be present in your BuildConfig.groovy as dependencies:

 `

Usage
-----

*create-app grails-platform-ui-scaffolding-test
*cd grails-platform-ui-scaffolding-test
*Add the following to `BuildConfig.grrovy` in your plugins{} dependency block

`compile ":platform-ui:1.0.RC3"`

*If you want to be able to test this in a theme other than a basic theme then also add:
`

### Either:
* Manually copy the files in the `/src/templates/scaffolding` folder
* Install the grails-platform-ui-scaffolding plugin and run the script
called `install-templates-platform-ui-scaffolding` to copy the templates.




