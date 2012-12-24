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


What is provided
----------------
These replacement templates should provided all the functionality of the Grails 2.x scaffolding templates, including
domain association links and validation constraints.


Usage
-----

### Basic Project Creation
* create-app grails-platform-ui-scaffolding-test
* cd grails-platform-ui-scaffolding-test
* Add the following to `BuildConfig.groovy` in your plugins{} dependency block

`compile ":platform-ui:1.0.RC3"`

*If you want to be able to test this in a theme other than a basic theme then also add:
`runtime ':bootstrap-theme:1.0.RC3'`


### Now either:

* Manually copy the files from the plugin's `/src/templates/scaffolding` folder to the root
project `/src/templates/scaffolding`


* Or install the grails-platform-ui-scaffolding plugin by referring it via a number of methods described here:
`http://grails.org/doc/latest/ref/Command%20Line/install-plugin.html`


If you install the plugin you run the script called `install-templates-platform-ui-scaffolding` to copy the templates
to the master project.

The benefit of using the plugin if you plan to change these templates is that it will set the
`src/templates/scaffolding` folder to be watched so any changes are effective on page refresh.

## Issues
* Raise an issue on in the github repository or send me a mail is you have problems. More testing needs to be done with more themes and some issues fixed.
* TODO.md contains some things I need to look at / understand better.
