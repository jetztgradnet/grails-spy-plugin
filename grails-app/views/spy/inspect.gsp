<html>
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name="layout" content="main">
		<title>Grails Spy</title>
		<g:javascript library="prototype"></g:javascript>
		<link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'beans.css')}" />
	</head>
	<body id="body">
		<h2>Grails Spy</h2>

		<div class="beans" id="beans">
			<div id="beanList" class="beanPanel">
				<h3>Beans</h3>
				<ul class="beanList">
					<g:each var="bean" in="${rootBeans}">
						<li class="bean"><g:link action="inspect" params="[path:bean.key]">${bean.key}</g:link></li>
					</g:each>			
				</ul>			
			</div>
			
			<div id="beanDetails" class="beanPanel">
				<g:if test="${inspected}">
					<g:if test="${inspected instanceof org.springframework.context.ApplicationContext }">
						<g:render template="applicationContext" model="[parentPath: parentPath, path: path, applicationContext:inspected, name:inspectedName]"/>
					</g:if>
					<g:elseif test="${inspected instanceof org.springframework.beans.factory.config.BeanDefinition }">
						<g:render template="bean" model="[parentPath: parentPath, path: path, beanDefinition:inspected, name:inspectedName]"/>
					</g:elseif>
					<g:else>
						<g:render template="object" model="[parentPath: parentPath, path: path, object:inspected, name:inspectedName]"/>
					</g:else>
				</g:if>
				<g:else>
					No object to inspect...
				</g:else>
			</div>
		</div>
	</body>
	
</html>