/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-10 07:36:52 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.gallery;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import gallery.domain.Gallery;
import gallery.repository.GalleryDAO;

public final class content_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

GalleryDAO galleryDAO = new GalleryDAO();
  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("gallery.repository.GalleryDAO");
    _jspx_imports_classes.add("gallery.domain.Gallery");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');

	request.setCharacterEncoding("UTF-8");
	
	// String gallery_idx = request.getParameter("gallery_idx");
	 int gallery_idx = Integer.parseInt(request.getParameter("gallery_idx"));
	out.print(gallery_idx);
	
	// String sql = "select * from gallery where gallery_idx=?" + gallery_idx;
	// out.print(sql);
	// select * from gallery where gallery_idx;
	
	Gallery gallery = galleryDAO.select(gallery_idx);

	// Gallery gallery = galleryDAO.select(Integer.parseInt(gallery_idx));

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script\r\n");
      out.write("	src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("	function edit() {\r\n");
      out.write("		if (confirm(\"수정?\")) {\r\n");
      out.write("			$(\"form\").attr(\"method\", \"post\");\r\n");
      out.write("			let v = $(\"input[type='file']\").val();\r\n");
      out.write("			if (true) { // 이미지를 업로드 하기 원하는 경우\r\n");
      out.write("				$(\"form\").attr(\"action\", \"/gallery/edit\");\r\n");
      out.write("				$(\"form\").attr(\"enctype\", \"multipart/form-data\");\r\n");
      out.write("			} else { // 텍스트만 수정하기를 원하는 경우\r\n");
      out.write("				$(\"form\").attr(\"action\", \"/gallery/update\");\r\n");
      out.write("			}\r\n");
      out.write("			$(\"form\").submit();\r\n");
      out.write("		}\r\n");
      out.write("	}\r\n");
      out.write("	function del() {\r\n");
      out.write("		if (confirm(\"삭제?\")) {\r\n");
      out.write("			// 삭제 요청을 받는 서버측 기술은 디자인이 요구되지 않으므로 서블릿으로 처리해도 무방\r\n");
      out.write("			// enctype = encoding\r\n");
      out.write("			// 폼태크 전송시 개발자가 아무 것도 명시하지 않으면 텍스트 전송이 기본값\r\n");
      out.write("			// 텍스트 전송에 사용되는 인코딩 타입은 application/x-www-form-urlencode 이고,\r\n");
      out.write("			// 이 방식은 바이너리 파일 전송이 불가능하다\r\n");
      out.write("			// 따라서 개발자가 파일도 함께 전송하려면 form태그의 전송 인코딩 방식을 multipart/form-data로 작성해야 한다\r\n");
      out.write("			$(\"form\").attr({\r\n");
      out.write("				\"action\" : \"/gallery/del\",\r\n");
      out.write("				\"method\" : \"post\",\r\n");
      out.write("			});\r\n");
      out.write("			$(\"form\").submit();\r\n");
      out.write("		}\r\n");
      out.write("	}\r\n");
      out.write("	$(function() {\r\n");
      out.write("		$($(\"input[type='button']\")[0]).click(function() {\r\n");
      out.write("			edit();\r\n");
      out.write("		});\r\n");
      out.write("		$($(\"input[type='button']\")[1]).click(function() {\r\n");
      out.write("			del();\r\n");
      out.write("		});\r\n");
      out.write("		$($(\"input[type='button']\")[2]).click(function() {\r\n");
      out.write("			location.href=\"/gallery/list.jsp\";\r\n");
      out.write("		});\r\n");
      out.write("	});\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"yellow\">\r\n");
      out.write("	<form>\r\n");
      out.write("		<table>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><input type=\"hidden\" name=\"gallery_idx\"\r\n");
      out.write("					value=\"");
      out.print(gallery.getGallery_idx());
      out.write("\"></td>\r\n");
      out.write("				<td><input type=\"hidden\" name=\"filename\"\r\n");
      out.write("					value=\"");
      out.print(gallery.getFilename());
      out.write("\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><input type=\"text\" name=\"title\"\r\n");
      out.write("					value=\"");
      out.print(gallery.getTitle());
      out.write("\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><input type=\"text\" name=\"writer\"\r\n");
      out.write("					value=\"");
      out.print(gallery.getWriter());
      out.write("\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><textarea name=\"content\" style=\"height: 200px\">");
      out.print(gallery.getContent());
      out.write("</textarea></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><img src=\"/data/");
      out.print(gallery.getFilename());
      out.write("\" width=\"500px\">\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td><input type=\"file\" name=\"file\"></td>\r\n");
      out.write("			</tr>\r\n");
      out.write("			<tr>\r\n");
      out.write("				<td>\r\n");
      out.write("				<input type=\"button\" value=\"수정\"> \r\n");
      out.write("						<input type=\"button\" value=\"삭제\">\r\n");
      out.write("						<input type=\"button\" value=\"목록\">\r\n");
      out.write("				</td>\r\n");
      out.write("			</tr>\r\n");
      out.write("		</table>\r\n");
      out.write("	</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
