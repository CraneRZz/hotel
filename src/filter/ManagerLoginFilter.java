package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class ManagerLoginFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest req,
			HttpServletResponse resp, FilterChain chain)
			throws ServletException, IOException {
		//不过滤的uri
		String[] notFilter = new String[] { "/manager/login","/manager/m_showDetail","/manager/m_subscriptionDetail","/manager/subscriptionDetail" };
		// 请求的path
		
		String path = req.getServletPath();
		// 是否过滤
		boolean doFilter = true;
		for (String s : notFilter) {
			if (s.equals(path)) {
				// 如果path中包含不过滤的地址，则不进行过滤
				doFilter = false;
				break;
			}
		}

		if (doFilter) {
			Object obj=req.getSession().getAttribute("manager");
			System.out.println("看看manager--------session的内容"+obj);
			if(obj==null){
				resp.sendRedirect(req.getContextPath()+"/showmanager/login");
			}else{
				chain.doFilter(req, resp);
			}
		}else{
			chain.doFilter(req, resp);
		}
		
	}

}