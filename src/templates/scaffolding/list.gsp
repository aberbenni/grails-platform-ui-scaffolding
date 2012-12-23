<% import grails.persistence.Event %>
<html>
<head>
<theme:title text="${className} list"/>
<theme:debugMode/>
<r:require module="plugin.platformUi.tools"/>
<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
<theme:layout name="dataentry"/>
</head>

<body>
<theme:zone name="body">

    <g:if test="\${flash.message}">
        <ui:message type="info">\${flash.message}</ui:message>
    </g:if>

    <ui:block>
        <ui:button kind="button" mode="primary" onclick="window.location='\${createLink(action:'create')}';"
                   value="Redirect" text="New ${className}"/>
    </ui:block>
    <ui:table>
        <ui:tr>
            <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
            allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
            props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
            Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
            props.eachWithIndex { p, i ->
                if (i < 6) {
                    if (p.isAssociation()) { %>
            <ui:th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></ui:th>
            <% } else { %>
            <g:sortableColumn property="${p.name}"
                              title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}"/>
            <% }
            }
            } %>
        </ui:tr>
        <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
            <ui:tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                <% props.eachWithIndex { p, i ->
                    if (i == 0) { %>
                <td><g:link action="show"
                            id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                <% } else if (i < 6) {
                    if (p.type == Boolean || p.type == boolean) { %>
                <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}"/></td>
                <% } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                <ui:td><g:formatDate date="\${${propertyName}.${p.name}}"/></td>
                    <% } else { %>
                    <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                    <% }
                    }
                    } %>
                </ui:tr>
            </g:each>
        </ui:table>

        <ui:paginate action='list' total="\${${propertyName}Total}"/>

    </theme:zone>
    </body>
    </html>
