import javax.inject {
	inject = inject__CONSTRUCTOR,
	inject__FIELD
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
import javax.enterprise.event {

	Event
}
import dddsample.qualifier {
	created
}

shared interface PersonDao {
	shared formal void persist(Person pessoa);
	shared formal Person|NoResultException find(Long id);
}

stateless
shared class PersonDaoImpl satisfies PersonDao {
	
		EntityManager entityManager;
	
		inject__FIELD created
		late Event<Person> createdPersonEvent;

		inject
		shared new(EntityManager entityManager) {
			this.entityManager = entityManager;
		}

	    transactional
		shared actual default void persist(Person person) {
            entityManager.persist(person);
            createdPersonEvent.fire(person);
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