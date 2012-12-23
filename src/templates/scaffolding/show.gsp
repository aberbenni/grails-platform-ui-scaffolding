<% import grails.persistence.Event %>

<html>
<head>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <theme:layout name="report"/>
    <theme:title text="Show"></theme:title>
<head>

<body>
<theme:zone name="body">

    <g:if test="\${flash.message}">
        <ui:message type="info">\${flash.message}</ui:message>
    </g:if>


    <g:fieldValue field="id" bean="\${${propertyName}}" />


    <ui:table>

        <% excludedProps = Event.allEvents.toList()  << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.each { p -> %>

            <g:if test="\${${propertyName}?.${p.name}}">

            <ui:tr>

                <td><g:message
                        code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></td>

                <td><% if (p.isEnum()) { %>
                    <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue
                            bean="\${${propertyName}}"
                            field="${p.name}"/></span>
                    <% } else if (p.oneToMany || p.manyToMany) { %>
                    <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                        <span class="property-value" aria-labelledby="${p.name}-label"><g:link
                                controller="${p.referencedDomainClass?.propertyName}" action="show"
                                id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    <% } else if (p.manyToOne || p.oneToOne) { %>
                    <span class="property-value" aria-labelledby="${p.name}-label"><g:link
                            controller="${p.referencedDomainClass?.propertyName}" action="show"
                            id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></span>
                    <% } else if (p.type == Boolean || p.type == boolean) { %>
                    <span class="property-value" aria-labelledby="${p.name}-label"><g:formatBoolean
                            boolean="\${${propertyName}?.${p.name}}"/></span>
                    <% } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                    <span class="property-value" aria-labelledby="${p.name}-label"><g:formatDate
                            date="\${${propertyName}?.${p.name}}"/></span>
                    <% } else if (!p.type.isArray()) { %>
                    <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue
                            bean="\${${propertyName}}"
                            field="${p.name}"/></span>
                    <% } %></td>
            </ui:tr>
        </g:if>
        <% } %>

    </ui:table>

    <ui:block>

        <ui:button kind="button" mode="cancel" onclick="window.location='\${createLink(action:'list')}';"
                   value="Redirect" text="Cancel"/>
        <ui:button kind="button" mode="primary"
                   onclick="window.location='\${createLink(action:'edit', id: '\${${propertyName}?.id}');}"
                   value="Redirect" text="Edit"/>


        <ui:button kind="button" mode="primary"
                   onclick="window.location='\${createLink(action:'edit', id: 'propertyName?.id');}"
                   value="Redirect" text="Edit2"/>


        <ui:button kind="anchor" mode="primary"
                   href="\${createLink(action:'edit', id:'\${entityName}')}"
                   value="Redirect" text="Edit"/>

    </ui:block>
</theme:zone>
</body>
</html>

