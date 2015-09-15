import javax.interceptor {

	interceptor,
	InvocationContext,
	aroundInvoke
}
import java.io {

	Serializable
}

log
interceptor
class LogInterceptorImpl() satisfies Serializable {
	
	aroundInvoke
	shared default Object log(InvocationContext ic) {
		print("before: ``ic.method``");
		value result = ic.proceed();
		print("after: ``ic.method``");
		
		return result;
	}
	
}