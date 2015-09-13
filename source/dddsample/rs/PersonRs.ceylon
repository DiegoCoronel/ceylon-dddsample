import dddsample.dao {
	PersonDao
}
import dddsample.model {
	Person
}

import javax.inject {
	inject__FIELD
}
import javax.ws.rs {
	path,
	produces,
	get,
	post,
	consumes,
	pathParam
}
import java.lang {

	Long
}
import javax.persistence {

	NoResultException
}

path("/person")
produces({"application/json"})
consumes({"application/json"})
shared class PersonRs {

	inject__FIELD
	late PersonDao dao;
	
	shared new() {
	}

	path("/health")	
	get
	shared default Boolean test() => true;
	
	path("/{id}")
	get
	shared default Person|NoResultException pessoa( pathParam("id") Long id ) {
		return dao.find(id); 
	}
	
	path("/persist")
	post
	shared default Person insert(Person person) {
		dao.persist(person);
		return person;
	}
	
}