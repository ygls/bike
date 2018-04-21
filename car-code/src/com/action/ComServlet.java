package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date2=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addZB")){  //add teacher
			String booktype=request.getParameter("booktype");
			String num=request.getParameter("num");
			String name=request.getParameter("name");
			String author=request.getParameter("author");
			String cbs=request.getParameter("cbs");
			String isbn=request.getParameter("isbn");
			String price=request.getParameter("price");
			
			String intro=request.getParameter("intro"); 
			 String member=(String)session.getAttribute("member"); 
				 int flag = cBean.comUp("insert into zb(title, content, dw,fzr,sj,lx,dz,yq,jbr,bj,lxr,lxfs,jbsj ,member) " +
							"values('"+booktype+"', '"+num+"', '"+name+"',	'"+author+"','"+cbs+"','"+isbn+"'," +
									"'"+price+"' ,'"+intro+"','无','无','无','无','无' ,'"+member+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
					}
			 
		}
		else if(method.equals("upZP")){ ///update teacher
			String id = request.getParameter("id");
			String booktype=request.getParameter("booktype");
			String num=request.getParameter("num");
			String name=request.getParameter("name");
			String author=request.getParameter("author");
			String cbs=request.getParameter("cbs");
			String isbn=request.getParameter("isbn");
			String price=request.getParameter("price");
			
			String intro=request.getParameter("intro"); 
			int flag = cBean.comUp("update zb set title='"+booktype+"', content='"+num+"', dw='"+name+"',	fzr='"+author+"'," +
					"sj='"+cbs+"',lx='"+isbn+"',dz='"+price+"',yq='"+intro+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("delZP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zb where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/zb/index.jsp").forward(request, response); 
			}
		}
		else if(method.equals("AdelZP")){  //del teacher
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from zb where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/zb/jb.jsp").forward(request, response); 
			}
			else { 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/zb/jb.jsp").forward(request, response); 
			}
		}
		else if(method.equals("wyJB")){ ///update teacher
			String id = request.getParameter("id");
			String jbr=request.getParameter("jbr");
			String bj=request.getParameter("bj");
			String lxr=request.getParameter("lxr");
			String lxfs=request.getParameter("lxfs"); 
			 
			int flag = cBean.comUp("update zb set jbr='"+jbr+"', bj='"+bj+"', lxr='"+lxr+"',	lxfs='"+lxfs+"',jbsj='"+date2+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/zb/jb.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/zb/jb.jsp").forward(request, response); 
			}
		}
		
		
		
		
		else if(method.equals("mTH")){ ///update teacher
			String id = request.getParameter("pid"); 
			 
			int flag = cBean.comUp("update post set th='已申请' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("member/prep/yi.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("member/prep/yi.jsp").forward(request, response); 
			}
		}
		else if(method.equals("aTH")){ ///update teacher
			String dnum = request.getParameter("dnum"); 
			 
			int flag = cBean.comUp("update post set th='已批准' where dnum='"+dnum+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "操作成功！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
			else if(flag == Constant.NAME_ERROR){ 
				request.setAttribute("message", "操作失败！");
				request.getRequestDispatcher("admin/prep/index.jsp").forward(request, response); 
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		else if(method.equals("FK")){  //
			//sfky,sfcg,xxmc,cs,zy,jy,gz,gzcs,dw,hy,xc,gzjy
			String sfky = request.getParameter("sfky");  
			String sfcg = request.getParameter("sfcg");  
			 String xxmc = request.getParameter("xxmc");  
			 String cs = request.getParameter("cs");  
			 String zy = request.getParameter("zy");  
			 String jy = request.getParameter("jy"); 
			 String gz = request.getParameter("gz");
			 String gzcs = request.getParameter("gzcs");
			 String dw = request.getParameter("dw");
			 String hy = request.getParameter("hy");
			 String xc = request.getParameter("xc");
			 String gzjy = request.getParameter("gzjy");
			 String member=(String)session.getAttribute("member");
			 int flag = cBean.comUp("update fk set sfky='"+sfky+"',sfcg='"+sfcg+"',xxmc='"+xxmc+"',cs='"+cs+"',zy='"+zy+"', jy='"+jy+"'," +
			 		"gz='"+gz+"',gzcs='"+gzcs+"',dw='"+dw+"',hy='"+hy+"',xc='"+xc+"',gzjy='"+gzjy+"' where member='"+member+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("member/prep/fk.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("member/prep/fk.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delFK")){  //
			//hm xm dh zz  zj sj sjzj lx bz 
			String id = request.getParameter("id");  
			int flag = cBean.comUp("update fk set sfky='无',sfcg='无',xxmc='无',cs='无',zy='无', jy='无'," +
			 		"gz='无',gzcs='无',dw='无',hy='无',xc='无',gzjy='无' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/fk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/fk/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("cXXX")){  //
			String lx=request.getParameter("lx");
			String str2=request.getParameter("str2");
			 
			if(lx.equals("realname")||lx.equals("sheng")||lx.equals("city")){
				String sql="select mid from pmember where "+lx+"  like '%"+str2+"%'";
				request.setAttribute("sql", sql);
				request.getRequestDispatcher("member/prep/sinfo2.jsp").forward(request, response); 
			}
			else if(lx.equals("gzcs")||lx.equals("cs")||lx.equals("hy")){
				String sql="select * from fk where "+lx+" like '%"+str2+"%' order by id  desc";
				request.setAttribute("sql", sql);
				request.getRequestDispatcher("member/prep/sinfo.jsp").forward(request, response); 
			}
		}
		else if(method.equals("ADDNEWS")){  //
			String title=request.getParameter("title");
			String fl=request.getParameter("fl");
			String content=request.getParameter("infoContent");
			int flag = cBean.comUp("insert into news(title,fl,content,sj) values('"+title+"','"+fl+"','"+content+"','"+date2+"')");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("editnews")){  //
			String id=request.getParameter("id");
			String title=request.getParameter("title");
			String fl=request.getParameter("fl");
			String content=request.getParameter("infoContent");
			int flag = cBean.comUp("update news set title='"+title+"',fl='"+fl+"',content='"+content+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("delNEWS")){  //
			String id=request.getParameter("id"); 
			int flag = cBean.comUp("delete from news  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/news/index.jsp").forward(request, response); 
				} 
		}
		else if(method.equals("KF")){  //
			String content=request.getParameter("infoContent"); 
			int flag = cBean.comUp("update kf set content='"+content+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/guestbook/index.jsp").forward(request, response); 
				} 
		}
		
		
		
		else if(method.equals("dp")){  //
			String sid=request.getParameter("sid"); 
			String dp=request.getParameter("dp"); 
			int flag = cBean.comUp("update sale set "+dp+"="+dp+"+1 where id='"+sid+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("id", sid);
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("hinfo.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("id", sid);
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("hinfo.jsp").forward(request, response); 
				} 
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
