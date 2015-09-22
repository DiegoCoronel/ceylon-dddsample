import dddsample_api.dao {
	PersonDao
}
import dddsample_api.model {
	Person
}
import dddsample_api.rs {
	PersonRs
}

import java.lang {
	Long
}

import javax.inject {
	inject  = inject__FIELD
}
import dddsample.interceptor {
	log
}

log
shared class PersonRsImpl satisfies PersonRs {

	inject
	late shared default PersonDao dao;
	
	shared new() {
	}
	
	shared actual default Person? pessoa(Long id) {
		return dao.find(id); 
	}
	
	shared actual default Person insert(Person person) {
		dao.persist(person);
		return person;
	}
	
}