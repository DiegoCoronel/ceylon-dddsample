import ceylon.language.meta {
	type
}
import ceylon.collection {

	HashMap
}
shared abstract class TransportStatus() 
	of not_received | in_port | onboard_carrier | claimed | unknown {
}

shared object not_received extends TransportStatus() {}
shared object in_port extends TransportStatus() {}
shared object onboard_carrier extends TransportStatus() {}
shared object claimed extends TransportStatus() {}
shared object unknown extends TransportStatus() {}



