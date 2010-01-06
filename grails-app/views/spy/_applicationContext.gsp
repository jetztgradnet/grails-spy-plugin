<div id="inspectionBodyApplicationContext">
	<a href="#appContext">ApplicationContext</a> | <a href="#childBeans">Beans</a> | <a href="#object">Object</a> | <a href="#properties">Properties</a>

	<a name="appContext">&nbsp;</a>
	<h3>ApplicationContext</h3>
	<table>
		<tr>
			<th>Name</th>
			<td>${context?.displayName}</td>
		</tr>
		<%--
		<tr>
			<th>Class</th>
			<td>${context?.class.name}</td>
		</tr>
		--%>
		<tr>
			<th>Parent</th>
			<td><g:if test="${context?.parent}"><g:link action="inspect" params="[path:(path + '/parent')]">${context?.parent?.displayName}</g:link></g:if></td>
		</tr>
	</table>
	
	<g:render template="object" model="[parentPath: parentPath, path: path, object:context, name:name]"/>
	
	<a name="childBeans">&nbsp;</a>
	<h3>Beans</h3>
	<ul class="beanList">
		<g:each var="beanName" in="${context?.beanFactory?.beanDefinitionNames?.sort()}">
			<li class="bean"><g:link action="inspect" params="[path:(path + '/' + beanName)]">${beanName}</g:link></li>
		</g:each>
	</ul>
</div>