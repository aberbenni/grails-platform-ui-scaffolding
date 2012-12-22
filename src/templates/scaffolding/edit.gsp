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
        <ui:fieldGroup>
            <g:render template="form"/>
        </ui:fieldGroup>
        <ui:actions>
            <ui:button kind="anchor" mode="secondary" href="\${createLink(action:'list')}"
                       value="Redirect" text="Cancel"/>
            <ui:button type="submit" kind="button" mode="danger" name="_action_delete"
                       text="\${message(code: 'default.button.delete.label', default: 'Delete')}"
                       formnovalidate="" value="delete"
                       onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            <ui:button type="submit" kind="button" mode="primary" name="update"
                       text="\${message(code: 'default.button.update.label', default: 'Update')}"/>
        </ui:actions>
    </ui:form>

</theme:zone>
</body>
</html>

