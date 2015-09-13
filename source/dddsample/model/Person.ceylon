import java.io {
	Serializable
}
import java.lang {
	Long
}

import javax.persistence {
	entity,
	id=id__FIELD,
	generatedValue=generatedValue__FIELD,
	namedQuery,
	namedQueries
}

entity
namedQueries({
	namedQuery{name = "Person.find";
	query = "from Person p where p.id = :id";}	
}) 
shared class Person satisfies Serializable{

	id
	generatedValue
	shared Long? id = null;
	
	shared variable String name;
	
	shared new () {
		name = "";
	}
	
}