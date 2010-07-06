package net.jetztgrad.grails.spy

class SpyFilters {

    def filters = {
        all(controller:'spy', action:'*') {
            before = {
				if (!grailsApplication?.config) {
					println "no config!"
				}
				if (!grailsApplication?.config?.grails?.plugins?.spy?.enabled) {
					render(status: 404, text: 'Not found')
					return false
				}
            }
        }
    }
    
}
