package fr.the2d2a_bo.web;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

import fr.the2d2a.web.constants.ParamConstants;

public class PDFServlet extends HttpServlet {
	
	private static final long serialVersionUID = -2799807738875192569L;
	protected static Logger logger = Logger.getLogger(PDFServlet.class);

	public class PDFThread implements Runnable {
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();		
		int p = 0;		
		
		public void run() {			
			Document doc = new Document();
			try {				
				PdfWriter.getInstance(doc, baos);
				doc.open();
				doc.add(new Paragraph("mdr ca fonctionne."));
				while (p < 99) {		            		            
					Thread.sleep(2);
					p++;
				}
			} catch (DocumentException e) {
				p = -1;
				e.printStackTrace();
			} catch (InterruptedException e) {
				p = -1;
				e.printStackTrace();
			}			
			doc.close();
			p = 100;
		}
		
		public ByteArrayOutputStream getPdf() throws DocumentException {
			if (p < 100) {
				throw new DocumentException("The document isn't finished yet!");
			}
			return baos;
		}
		
		public int getPercentage() {
			return p;
		}
	}
	    
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	logger.debug("doGet");
        HttpSession session = request.getSession(true);
        Object o = session.getAttribute(ParamConstants.PDF_FILE);
        PDFThread pdf;
        if (o == null) {
        	pdf = new PDFThread();
        	session.setAttribute(ParamConstants.PDF_FILE, pdf);
        	Thread t = new Thread(pdf);
        	t.start();
        }
        else {
        	pdf = (PDFThread)o;
        }
        response.setContentType("text/html");
        switch (pdf.getPercentage()) {
        	case -1:
        		isError(response.getOutputStream());
        		return;
        	case 100:
        		isFinished(response.getOutputStream());
        		return;
        	default:
        		isBusy(pdf, response.getOutputStream());
        		return;
        }
    }
	
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
    	logger.debug("doPost");
        HttpSession session = request.getSession(false);
        try {
        	PDFThread pdf = (PDFThread) session.getAttribute(ParamConstants.PDF_FILE);
        	session.removeAttribute(ParamConstants.PDF_FILE);
			ByteArrayOutputStream baos = pdf.getPdf();
			response.setHeader("Expires", "0");
			response.setHeader("Cache-Control", "must-revalidate, post-check=0, pre-check=0");
			response.setHeader("Pragma", "public");
			response.setContentType("application/pdf");
			response.setContentLength(baos.size());
			ServletOutputStream out = response.getOutputStream();
			baos.writeTo(out);
			out.flush();
        }
        catch(Exception e) {
        	isError(response.getOutputStream());
        }
    }

	private void isBusy(PDFThread pdf, ServletOutputStream stream) throws IOException {
		stream.print("<html>\n\t<head>\n\t\t<title>Document en cours de g&eacute;n&eacute;ration...</title>\n\t\t<meta http-equiv=\"Refresh\" content=\"5\">\n\t</head>\n\t<body>");
		stream.print(String.valueOf(pdf.getPercentage()));
		stream.print("% du document est pr&ecirc;t.<br/>\n\t</body>\n</html>");
	}

	private void isFinished(ServletOutputStream stream) throws IOException {
		stream.print("<html>\n\t<head>\n\t\t<title>Document fini!</title>\n\t</head>\n\t<body>");
		stream.print("Le document est pr&ecirc;t :<form method=\"POST\"><input type=\"Submit\" value=\"Afficher le PDF\"></form>\n\t</body>\n</html>");
	}

	private void isError(ServletOutputStream stream) throws IOException {
		stream.print("<html>\n\t<head>\n\t\t<title>Erreur</title>\n\t</head>\n\t<body>");
		stream.print("Probl&ecirc;me de g&eacute;n&eacute;ration du document.\n\t</body>\n</html>");
	}
}
