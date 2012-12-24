
TODO

- Go through all the templates to tweak the usage of platform-core/ui tags.

- Work out why using <theme:head> and <theme:body> is giving errors in combination with <theme:title>.
  currently put in <head> and <body> tags. *Most likely incorrect usage/positioning.. need to do some digging. *

- <ui:input> and <ui:field> usage for the _form template and look whether tags like <ui:td> etc need to be available
  to remove all html from templates.

- Only dynamically watch the scaffolded templates folder (/src/templates/scaffolding) when the config value:
  watchScaffoldedTemplates=true in the main application config. Currently it set in the plugin onChange() in
  GrailsPlatformUiScaffoldingGrailsPlugin.groovy. This makes sure the template files are reloaded every time they
  change.. essential when you are changing them.

- Test with other themes

- Get any hardcoded labels out the templates.




