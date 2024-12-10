package listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebListener
public class DateTimeServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentDateTime = sdf.format(new Date());
        sce.getServletContext().setAttribute("currentDateTime", currentDateTime);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
