import ceylon.interop.java {
	javaClass
}

import dddsample_api.dao {
	PersonDao
}
import dddsample_api.model {
	Person
}

import java.lang {
	Long
}

import javax.ejb {
	stateless
}
import javax.enterprise.event {
	Event
}
import javax.inject {
	inject=inject__CONSTRUCTOR
}
import javax.persistence {
	EntityManager,
	NoResultException
}
import javax.transaction {
	transactional
}

stateless
shared class PersonDaoImpl satisfies PersonDao {
	
	EntityManager entityManager;
	
	Event<Person> createdPersonEvent;
	
	inject
	shared new(EntityManager entityManager, Event<Person> createdPersonEvent) {
		this.entityManager = entityManager;
		this.createdPersonEvent = createdPersonEvent;
	}
	
	transactional
	shared actual default void persist(Person person) {
		entityManager.persist(person);
		createdPersonEvent.fire(person);
	}
	
	shared actual default Person? find(Long id) {
		try {
			return entityManager.createNamedQuery("Person.find",javaClass<Person>())
					.setParameter("id", id)
					.singleResult;
		} catch (NoResultException e) {
			return null;
		}
	}
	
}