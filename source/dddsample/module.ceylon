native("jvm")   module dddsample "1.0.0" {
	
	//API
	shared import dddsample_api "1.0.0";
	
	// Base
	shared import javax.inject "1";
	shared import ceylon.interop.java "1.1.1";
	
	// JEE
	shared import hibernatejpa21api "jpa-2.1-api-1.0.0.Final";
	shared import cdiapi "api-1.2";
	shared import ejbapi32spec "1.0.0.Final";
	shared import annotationsapi12spec "1.0.0.Final";
	
	shared import "org.jboss.resteasy:jaxrs-api" "3.0.11.Final";
	shared import "org.jboss.spec.javax.transaction:jboss-transaction-api_1.2_spec" "1.0.0.Final";
	shared import "com.fasterxml.jackson.core:jackson-databind" "2.5.1";
	shared import "com.fasterxml.jackson.core:jackson-core" "2.5.1";
	shared import "org.jboss.spec.javax.interceptor:jboss-interceptors-api_1.2_spec" "1.0.0.Final";
	
	// Here to workaround some limitations of Ceylon in Wildfly, but should be remove at some point
	shared import jbossvfs "3.2.9.Final";
	shared import hibernateentitymanager "4.3.10.Final";
	
}
