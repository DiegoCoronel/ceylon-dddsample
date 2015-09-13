import dddsample.model {
	Person
}

import javax.enterprise.event {
	observes
}
import dddsample.qualifier {
	created
}

shared class PessoaListener() {
	
	shared void pessoaCreated(observes created Person person) {
		print("Created person: [``person.id else "null"``] ``person.name``");
	}
	
}
