import dddsample_api.model {
	Person
}

import java.lang {
	Long
}

import javax.ws.rs {
	path,
	produces,
	get,
	post,
	consumes,
	pathParam
}
import javax.ws.rs.core {
	MediaType
}

path("/person")
produces({MediaType.\iAPPLICATION_JSON})
consumes({MediaType.\iAPPLICATION_JSON})
shared interface PersonRs {
	
	path("/health")	
	get
	shared default Boolean test() => true;
	
	path("/{id}")
	get
	shared formal Person? pessoa( pathParam("id") Long id );
	
	path("/persist")
	post
	shared formal Person insert(Person person);
	
}