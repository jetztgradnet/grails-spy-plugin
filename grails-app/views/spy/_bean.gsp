<div id="inspectionBodyBean">
	<a name="bean">&nbsp;</a>
	<h3>Bean ${name}</h3>
	<table>
		<%--
		<tr>
			<th>Name</th>
			<td>${name}</td>
		</tr>
		 --%>
		<tr>
			<th>Class</th>
			<td>${beanDefinition?.beanClassName}</td>
		</tr>
		<g:if test="${beanDefinition?.description}">
			<tr>
				<th>Description</th>
				<td>${beanDefinition?.description}</td>
			</tr>
		</g:if>
		<g:if test="${beanDefinition?.dependsOn}">
			<tr>
				<th>Depends on:</th>
				<td>${beanDefinition?.dependsOn.join(', ')}"></td>
			</tr>
		</g:if>
		<tr>
			<th>Lazy Init</th>
			<td>${beanDefinition?.lazyInit}</td>
		</tr>
		<tr>
			<th>Scope</th>
			<td>${beanDefinition?.scope}</td>
		</tr>
		<%--
		<tr>
			<th>Singleton</th>
			<td>${beanDefinition?.singleton}</td>
		</tr>
		 --%>
		<tr>
			<th>Abstract</th>
			<td>${beanDefinition?.isAbstract()}</td>
		</tr>
		<tr>
			<th>Autowire Mode</th>
			<td>${beanDefinition?.autowireCandidate}</td>
		</tr>
		<g:if test="${beanDefinition?.parentName}">
			<tr>
				<th>Parent bean name</th>
				<td><g:link action="inspect" params="[path:(parentPath + '/' + value?.beanName)]">${beanDefinition?.parentName}</g:link></td>
			</tr>
		</g:if>
		<g:if test="${beanDefinition?.factoryBeanName}">
			<tr>
				<th>Factory bean name</th>
				<td><g:link action="inspect" params="[path:(parentPath + '/' + value?.beanName)]">${beanDefinition?.factoryBeanName}</g:link></td>
			</tr>
		</g:if>
		<g:if test="${beanDefinition?.factoryMethodName}">
			<tr>
				<th>Factory method</th>
				<td>${beanDefinition?.factoryMethodName}</td>
			</tr>
		</g:if>
	</table>
	
	<a name="beanProperties">&nbsp;</a>
	<h3>Bean Properties</h3>
	<table><tr><td>
	<g:render template="value" model="[parentPath: parentPath, path: path, name: null, value: beanDefinition?.propertyValues]"/>
	</td></tr>
	<tr><td>
	<g:render template="value" model="[parentPath: parentPath, path: path, name: null, value: beanDefinition?.constructorArgumentValues]"/>
	</td></tr>
	</table>
</div>