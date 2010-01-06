<g:if test="${value instanceof org.springframework.beans.factory.config.BeanReference}">
	Reference <g:link action="inspect" params="[path:(parentPath + '/' + value?.beanName)]">${value?.beanName}</g:link>
</g:if>
<g:elseif test="${value instanceof org.springframework.context.ApplicationContext}">
	ApplicationContext <g:link action="inspect" params="[path:(path + '/' + name)]">${value?.displayName}</g:link>
</g:elseif>
<g:elseif test="${value instanceof org.springframework.beans.PropertyValues}">
	Properties (${value?.propertyValues?.size()} elements, ${value?.getClass()?.name})
	<g:if test="${value?.size() > 0}">
		<table>
			<tr>
				<th>Property</th>
				<th>Value</th>
			</tr>
			<g:each var="prop" in="${value?.propertyValues}">
				<tr>
					<th>${prop?.name}</th>
					<td><g:render template="value" model="[parentPath: parentPath, path: path, name: prop?.name, value: prop?.value]"/></td>
				</tr>
			</g:each>
		</table>
	</g:if>
</g:elseif>
<g:elseif test="${value instanceof org.springframework.beans.PropertyValue}">
	<g:render template="value" model="[parentPath: parentPath, path: path, name: entry.key, value: value?.value]"/>
</g:elseif>
<g:elseif test="${value instanceof org.springframework.beans.factory.config.ConstructorArgumentValues}">
Constructor Arguments (${value?.argumentCount} arguments)
<g:if test="${value?.argumentCount > 0}">
	<table>
		<tr>
			<th>Index</th>
			<th>Value</th>
		</tr>
		<g:each var="arg" in="${value?.genericArgumentValues}">
			<tr>
				<th>${arg?.name}</th>
				<td><g:render template="value" model="[parentPath: parentPath, path: path, name: arg?.name, value: arg?.value]"/></td>
			</tr>
		</g:each>
	</table>
</g:if>
</g:elseif>
<g:elseif test="${value instanceof java.util.Map}">
	Map (${value?.size()} elements, ${value?.getClass()?.name})
	<g:if test="${value?.size() > 0}">
		<table>
			<tr>
				<th>Property</th>
				<th>Value</th>
			</tr>
			<g:each var="entry" in="${value}">
				<tr>
					<th>${entry.key}</th>
					<td><g:render template="value" model="[parentPath: parentPath, path: path, name: entry.key, value: entry?.value]"/></td>
				</tr>
			</g:each>
		</table>
	</g:if>
</g:elseif>
<g:elseif test="${value instanceof java.util.Collection}">
	Collection (${value?.size()} elements, ${value?.getClass()?.name})
	<g:if test="${value?.size() > 0}">
		<table>
			<tr>
				<th>Value</th>
			</tr>
			<g:each var="entry" in="${value}">
				<tr>
					<td><g:render template="value" model="[parentPath: parentPath, path: path, name: null, value: entry]"/></td>
				</tr>
			</g:each>
		</table>
	</g:if>
</g:elseif>
<g:elseif test="${value instanceof Object[]}">
	Collection (${value?.size()} elements, ${value?.getClass()?.name})
	<g:if test="${value?.size() > 0}">
		<table>
			<tr>
				<th>Value</th>
			</tr>
			<g:each var="entry" in="${value}">
				<tr>
					<td><g:render template="value" model="[parentPath: parentPath, path: path, name: null, value: entry]"/></td>
				</tr>
			</g:each>
		</table>
	</g:if>
</g:elseif>
<g:else>${value}</g:else>
