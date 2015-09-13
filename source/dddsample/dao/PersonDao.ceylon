import javax.inject {
	inject = inject__CONSTRUCTOR
}
import javax.persistence {
	EntityManager,
	NoResultException
}
import dddsample.model {
	Person
}
import javax.ejb {
	stateless
}
import javax.transaction {
	transactional
}
import java.lang {
	Long
}
import ceylon.interop.java {

	javaClass
}

shared interface PersonDao {
	shared formal void persist(Person pessoa);
	shared formal Person|NoResultException find(Long id);
}

stateless
shared class PersonDaoImpl satisfies PersonDao {
	
		EntityManager entityManager;

		inject
		shared new(EntityManager entityManager) {
			this.entityManager = entityManager;
		}

	    transactional
		shared actual default void persist(Person person) {
            entityManager.persist(person);
		}
		
	    shared actual default Person|NoResultException find(Long id) {
			try {
				return entityManager.createNamedQuery("Person.find",javaClass<Person>())
						.setParameter("id", id)
						.singleResult;
			} catch (NoResultException e) {
				return e;
			}
		}
		
}