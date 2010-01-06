<div id="inspectionBodyApplicationContext">
	<h3>ApplicationContext</h3>
	<table>
		<tr>
			<th>Name</th>
			<td>${applicationContext?.displayName}</td>
		</tr>
		<%--
		<tr>
			<th>Class</th>
			<td>${applicationContext?.class.name}</td>
		</tr>
		 --%>
		<tr>
			<th>Parent</th>
			<td><g:if test="${applicationContext?.parent}"><g:link action="inspect" params="[path:(path + '/parent')]">${applicationContext?.parent?.displayName}</g:link></g:if></td>
		</tr>
	</table>
	
	<g:render template="object" model="[parentPath: parentPath, path: path, object:applicationContext, name:name]"/>
	
	<h3>Beans</h3>
	<ul class="beanList">
		<g:each var="beanName" in="${applicationContext?.beanFactory?.beanDefinitionNames?.sort()}">
			<li class="bean"><g:link action="inspect" params="[path:(path + '/' + beanName)]">${beanName}</g:link></li>
		</g:each>
	</ul>
</div>