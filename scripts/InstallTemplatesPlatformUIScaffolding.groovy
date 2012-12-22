import org.codehaus.groovy.grails.plugins.GrailsPluginUtils

includeTargets << grailsScript("_GrailsInit")

target(installPlatformUIScaffoldTemplates: "Installs the jQuery-mobile scaffolding templates") {
    depends(checkVersion, parseArguments)

    sourceDir = "${GrailsPluginUtils.getPluginDirForName('grails-platform-ui-scaffolding').getURI().getRawPath()}" + "/src/templates/scaffolding"

    println("sourceDir ${sourceDir}")

    targetDir = "${basedir}/src/templates/scaffolding"
    println("targetDir ${targetDir}")

    overwrite = false

    // only if template dir already exists in, ask to overwryite templates
    if (new File(targetDir).exists()) {
        if (!isInteractive || confirmInput("Overwrite existing templates?", "overwrite.templates")) {
            overwrite = true
        }
    } else {
        ant.mkdir(dir: targetDir)
    }

    ant.copy(todir: "$targetDir", overwrite: overwrite) {
        fileset dir: "$sourceDir"
    }

    event "StatusUpdate", ["Platform-UI Scaffolding templates installed successfully"]
}

setDefaultTarget installPlatformUIScaffoldTemplates