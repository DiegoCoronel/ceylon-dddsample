import dddsample_api.model {
	Person
}

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
	namedQueries,
	table
}

entity
table{ name = "person" ;}
namedQueries ({
	namedQuery { name = "Person.find";
	query = "from PersonImpl p where p.id = :id"; }
})
shared class PersonImpl satisfies Person & Serializable {
	
	id
	generatedValue
	shared actual Long? id = null;
	
	shared actual variable String name;
	
	shared new () {
		name = "";
	}
}
