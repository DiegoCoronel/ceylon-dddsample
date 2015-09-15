import dddsample_api.model {
	Person
}

import java.lang {
	Long
}

shared interface PersonDao {
	shared formal void persist(Person pessoa);
	shared formal Person? find(Long id);
}
