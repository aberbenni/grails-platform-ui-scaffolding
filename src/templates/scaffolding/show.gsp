<% import grails.persistence.Event %>

<html>
<head>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>

    <theme:layout name="dataentry"/>
    <theme:title text="Show"></theme:title>
<head>

<body>
<theme:zone name="body">

    <g:if test="\${flash.message}">
        <ui:message type="info">\${flash.message}</ui:message>
    </g:if>

        <ui:button kind="button" mode="secondary" onclick="window.location='\${createLink(action:'create')}';"
                   value="Redirect" text="New ${className}"/>
        <ui:button kind="button" mode="primary" onclick="window.location='\${createLink(action:'edit', id: '1')}';"
                   value="Redirect" text="Edit ${className}"/>

    <ol class="property-list ${domainClass.propertyName}">
        <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.each { p -> %>
        <g:if test="\${${propertyName}?.${p.name}}">
            <li class="fieldcontain">
                <span id="${p.name}-label" class="property-label"><g:message
                        code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></span>
                <% if (p.isEnum()) { %>
                <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}"
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
                <span class="property-value" aria-labelledby="${p.name}-label"><g:fieldValue bean="\${${propertyName}}"
                                                                                             field="${p.name}"/></span>
                <% } %>
            </li>
        </g:if>
        <% } %>
    </ol>

</theme:zone>
</body>
</html>

