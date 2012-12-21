import org.codehaus.groovy.grails.plugins.GrailsPlugin

class GrailsPlatformUiScaffoldingGrailsPlugin {
    // the plugin version
    def version = "0.1"
    // the version or versions of Grails the plugin is designed for
    def grailsVersion = "2.0 > *"
    // the other plugins this plugin depends on
    def dependsOn = [:]
    // resources that are excluded from plugin packaging
    def pluginExcludes = [
            "grails-app/views/error.gsp"
    ]

    def title = "Grails Platform Ui Scaffolding Plugin" // Headline display name of the plugin
    def author = "Dan Roden"
    def authorEmail = "dan.roden@mintsrc.com"
    def description = '''\
 .
'''

    // URL to the plugin's documentation
    def documentation = "http://grails.org/plugin/grails-platform-ui-scaffolding"

    // watch for changes to scaffolding templates...
    def watchedResources = "file:./src/templates/scaffolding/*"

    // ... and kick the scaffolding plugin when they change
    def onChange = { event ->
        event.manager.getGrailsPlugin('scaffolding').notifyOfEvent(
                GrailsPlugin.EVENT_ON_CHANGE, null)
    }

    // License: one of 'APACHE', 'GPL2', 'GPL3'
    def license = "APACHE"

    // Details of company behind the plugin (if there is one)
    def organization = [ name: "mintsource", url: "http://www.mintsrc.com/" ]

    // Any additional developers beyond the author specified above.
    def developers = [ [ name: "Dan Roden", email: "dan.roden@mintsrc.com" ]]

    // Location of the plugin's issue tracker.
//    def issueManagement = [ system: "JIRA", url: "http://jira.grails.org/browse/GPMYPLUGIN" ]

    // Online location of the plugin's browseable source code.
//    def scm = [ url: "http://svn.codehaus.org/grails-plugins/" ]

    def doWithWebDescriptor = { xml ->
        // TODO Implement additions to web.xml (optional), this event occurs before
    }

    def doWithSpring = {
        // TODO Implement runtime spring config (optional)
    }

    def doWithDynamicMethods = { ctx ->
        // TODO Implement registering dynamic methods to classes (optional)
    }

    def doWithApplicationContext = { applicationContext ->
        // TODO Implement post initialization spring config (optional)
    }

    def onConfigChange = { event ->
        // TODO Implement code that is executed when the project configuration changes.
        // The event is the same as for 'onChange'.
    }

    def onShutdown = { event ->
        // TODO Implement code that is executed when the application shuts down (optional)
    }
}
