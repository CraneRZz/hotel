package util;

import java.util.Date;

public class SubscriptionNoUtil {
	public static synchronized String getSubscriptionNo(){
		return String.valueOf(new Date().getTime());
	}
}
