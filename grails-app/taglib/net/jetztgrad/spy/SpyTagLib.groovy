package net.jetztgrad.spy

class SpyTagLib {
	static namespace = 'spy'
	
	def trail = { attrs, body ->
		def path = attrs?.path
		def parentPath = ''
		
		def writer = getOut()
		def pathElements = attrs?.path?.toString().tokenize('/')
		if (pathElements.size() > 0) {
			pathElements.remove(pathElements.size() - 1)
		}
		pathElements.eachWithIndex { name, index ->
			if (index > 0) {
				writer << ' -&gt; '
			}
			if (parentPath.size()) {
				parentPath = "$parentPath/$name"
			}
			else {
				parentPath = "$name"
			}
			writer << "<a href=\"${g.createLink(controller:'spy', action:'inspect', params:[path:parentPath])}\">$name</a>"
		}
	}
}
