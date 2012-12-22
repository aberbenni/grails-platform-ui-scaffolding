
TODO



- Go through all the templates to tweak the usage of platform-core/ui tags.

- Work out why using <theme:head> and <theme:body> is giving errors in combination with <theme:title>.
  currently put in <head> and <body> tags. *Most likely incorrect usage/positioning.. need to do some digging. *

- <ui:input> and <ui:field> usage for the _form template

- The plugin currently doesn't declare its own dependencies on platform-ui etc so will not transitively pull them or
  work in run-app mode with changing the BuildConfig.groovy in the plugin. Work out whether this is the best way
  as it avoids having to update based on evolving platform-core/ui plugin versions and it should only really be
  included in a project in dev mode anyway.

- Only dynamically watch the scaffolded templates folder (/src/templates/scaffolding) when the config value:
  watchScaffoldedTemplates=true in the main application config. Currently it set in the plugin onChange() in
  GrailsPlatformUiScaffoldingGrailsPlugin.groovy. This makes sure the template files are reloaded every time they
  change.. essential when you are changing them.

- Test with other themes




