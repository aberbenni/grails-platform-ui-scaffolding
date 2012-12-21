<html>
<head>
    <theme:layout name="dataentry"/>
    <theme:title text="Edit ${className}"></theme:title>
<head>

<body>
<theme:zone name="body">

    <g:if test="\${flash.message}">
        <ui:message type="info">\${flash.message}</ui:message>
    </g:if>
    <g:hasErrors bean="\${${propertyName}}">
            <g:eachError bean="\${${propertyName}}" var="error">
                    <ui:message type="error" text="\${error}"/>
            </g:eachError>
    </g:hasErrors>

    <ui:form action="update">
        <g:hiddenField name="id" value="\${${propertyName}?.id}"/>
        <g:hiddenField name="version" value="\${${propertyName}?.version}"/>
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <ui:actions>
            <ui:button kind="submit" mode="primary" text="\${message(code: 'default.button.update.label', default: 'Update')}" />
        </ui:actions>
    </ui:form>

</theme:zone>
</body>
</html>

