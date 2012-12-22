<html>
<head>
    <theme:layout name="dataentry"/>
    <theme:title text="Create ${className}"></theme:title>
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

    <ui:form action="save">

        <ui:fieldGroup>
            <g:render template="form"/>
        </ui:fieldGroup>

        <ui:actions>
            <ui:button kind="button" mode="secondary" onclick="window.location='\${createLink(action:'list')}';"
                       value="Redirect" text="Cancel"/>
            <ui:button type="submit" kind="button" mode="primary" name="create"
                       text="\${message(code: 'default.button.create.label', default: 'Create')}"/>
        </ui:actions>
    </ui:form>
</theme:zone>
</body>
</html>

