import dddsample.model {
	Person
}

import java.lang {
	Long
}

import javax.persistence {
	NoResultException
}

shared interface PersonDao {
	shared formal void persist(Person pessoa);
	shared formal Person|NoResultException find(Long id);
}
