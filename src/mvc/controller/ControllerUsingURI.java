package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

// 1.properties �뙆�씪 �씫�뼱�꽌 留ㅽ븨�젙蹂� 留듭뿉 ���옣
// 2.由ы�섏뒪�듃�뿉�꽌 uri瑜� 爰쇰궡 留ㅽ븨�젙蹂대�� 李몄“�븯�뿬 �빐�떦 �빖�뱾�윭瑜� 爰쇰궦�떎
// 3.�빐�떦 �빖�뱾�윭濡� 由ы�섏뒪�듃 �꽆湲곌퀬 泥섎━ 寃곌낵瑜� 諛쏆븘 �듅�젙 酉곕줈 �씠�룞�떆�궓�떎.
public class ControllerUsingURI extends HttpServlet {

    // <而ㅻ㎤�뱶, �빖�뱾�윭�씤�뒪�꽩�뒪> 留ㅽ븨 �젙蹂� ���옣
    private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();

    public void init() throws ServletException {
        String configFile = getInitParameter("configFile");
        Properties prop = new Properties();
        String configFilePath = getServletContext().getRealPath(configFile);
        try (FileReader fis = new FileReader(configFilePath)) {
            prop.load(fis);
        } catch (IOException e) {
            throw new ServletException(e);
        }
        Iterator keyIter = prop.keySet().iterator();
        while (keyIter.hasNext()) {
            String command = (String) keyIter.next();
            String handlerClassName = prop.getProperty(command);
            try {
                Class<?> handlerClass = Class.forName(handlerClassName);
                CommandHandler handlerInstance = 
                        (CommandHandler) handlerClass.newInstance();
                commandHandlerMap.put(command, handlerInstance);
            } catch (ClassNotFoundException | InstantiationException 
            		| IllegalAccessException e) {
                throw new ServletException(e);
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

    protected void doPost(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request,
    HttpServletResponse response) throws ServletException, IOException {
		String command = request.getRequestURI();
		System.out.println("command:" + command);
		if (command.indexOf(request.getContextPath()) == 0) {
			command = command.substring(request.getContextPath().length());
		}
		System.out.println("command:" + command);
        CommandHandler handler = commandHandlerMap.get(command);
        System.out.println("handler:" + handler);
        if (handler == null) {
            handler = new NullHandler();
        }
        String viewPage = null;
        try {
            viewPage = handler.process(request, response);
        } catch (Throwable e) {
            throw new ServletException(e);
        }
        if (viewPage != null) {
	        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	        dispatcher.forward(request, response);
        }
    }
}
