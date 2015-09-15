import dddsample.qualifier {
	created
}

import dddsample_api.model {
	Person
}

import javax.enterprise.event {
	observes
}

shared class PessoaListener() {
	
	shared void pessoaCreated(observes created Person person) {
		print("Created person: [``person.id else "null"``] ``person.name``");
	}
	
}
