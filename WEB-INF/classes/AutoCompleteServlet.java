import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import beans.*;

@SuppressWarnings("unchecked")

public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private MainCatalog prodData = new MainCatalog();
    private HashMap<String, ProductData> products = prodData.showcatalog();

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        String targetId = request.getParameter("id");
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/index.jsp").forward(request, response);
        }

        boolean namesAdded = false;
        if (action.equals("complete")) {

            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = products.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    ProductData product = (ProductData) products.get(id);

                    if ( // targetId matches product name
                         product.getDescription().toLowerCase().startsWith(targetId) ){

                        sb.append("<product>");
                        sb.append("<id>" + product.getProdId() + "</id>");
                        sb.append("<productName>" + product.getDescription() + "</productName>");
                        sb.append("</product>");
                        namesAdded = true;
                    }
                }
            }

            if (namesAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<products>" + sb.toString() + "</products>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }

        if (action.equals("lookup")) {


            if ((targetId != null) && products.containsKey(targetId.trim())) {
                request.setAttribute("product", products.get(targetId));
                context.getRequestDispatcher("/catalog.jsp").forward(request, response);
            }
        }
    }
}
