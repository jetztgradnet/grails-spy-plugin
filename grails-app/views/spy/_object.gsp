<div id="inspectionBodyObject">
	<h3>Object</h3>
	<table>
		<%--
		<tr>
			<th>Name</th>
			<td>${name}</td>
		</tr>
		 --%>
		<tr>
			<th>Class</th>
			<td>${object?.class.name}</td>
		</tr>
		<tr>
			<th>String representation</th>
			<td>${object?.toString()}</td>
		</tr>
	</table>
	
	<h3>Properties</h3>
	<table>
		<tr>
			<th>Property</th>
			<th>Value</th>
		</tr>
		<g:each var="prop" in="${object?.properties}">
			<tr>
				<th>${prop.key}</th>
				<td><%--${prop.value} --%>
				<g:render template="value" model="[parentPath: parentPath, path: path, name: prop?.key, value: prop?.value]"/>
				</td>
			</tr>
		</g:each>
	</table>
</div>