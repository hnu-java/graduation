package util;

/**
 * Created by ${mjy} on 2018/4/17.
 */

import com.google.gson.Gson;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.BaseFont;
//import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.lowagie.text.HeaderFooter;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.html.simpleparser.StyleSheet;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
//import org.xhtmlrenderer.pdf.*;
//import org.xhtmlrenderer.layout.SharedContext;
import dao.CatalogDao;
import dao.DocumentDao;
import dao.ShowOrgProjectDao;
import daoImp.CatalogDaoImp;
import daoImp.DocumentDaoImp;
import daoImp.ShowOrgProjectDaoImp;
import entity.*;

import java.awt.Color;
import java.io.IOException;
import com.lowagie.text.DocumentException;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.io.*;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

// 原mjy学长代码 有修改格式zww 页眉问题
//public class Template2Pdf {
//
//
//
//
//    private static final Paragraph BLANK = new Paragraph(" ");
//    BaseFont stChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
//    Font title = new Font(stChinese, 24, Font.NORMAL, BaseColor.BLACK);
//    Font stitle = new Font(stChinese, 14, Font.NORMAL, BaseColor.BLACK);
//    Font first_index = new Font(stChinese, 18, Font.NORMAL, BaseColor.BLACK);
//    Font second_index = new Font(stChinese, 15, Font.NORMAL, BaseColor.BLACK);
//    Font other_index = new Font(stChinese, 14, Font.NORMAL, BaseColor.BLACK);
//    Font catalog = new Font(stChinese, 16, Font.BOLD, BaseColor.BLACK);
//    Font black = new Font(stChinese, 12, Font.BOLD, BaseColor.BLACK);
//
//    public Template2Pdf() throws IOException, DocumentException {
//    }
//
//
//    public class pdfFont extends XMLWorkerFontProvider {
//        public pdfFont() {
//            super(null, null);
//        }
//
//        @Override
//        public Font getFont(String fontname, String encoding, float size, int style) {
//            Font FontChinese = null;
//            FontChinese = new Font(stChinese, 12, Font.NORMAL);
//            if (FontChinese == null) {
//                FontChinese = super.getFont(fontname, encoding, size, style);
//            }
//            return FontChinese;
//        }
//    }
//
//    private void add2Document(Document document, String line, PdfWriter writer) throws DocumentException, IOException {
//        Font cfont = new Font(stChinese);
//        line = line.replaceAll("png\">", "png\" />");
//        line = line.replaceAll("<br>", "<br />");
//        line = line.replaceAll("<hr>", "<hr />");
//        line = line.replaceAll(">暂无","/>暂无");
////        line = line.replaceAll("src=\"", "src=\"http://localhost:8080");
//        line = "<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; " + line + "</div>";
//        XMLWorkerHelper.getInstance().parseXHtml(writer, document,
//                new ByteArrayInputStream(line.getBytes("UTF-8")),
//                null,
//                Charset.forName("UTF-8"), new pdfFont());
//
//    }
//
//    public InputStream createPdf(int id_document) throws IOException, DocumentException {
//        Gson gson = new Gson();
//        Document document = new Document(PageSize.A4, 62, 62, 72,72);
//        BaseFont stChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
//        Font cfont = new Font(stChinese);
//        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
//        CatalogDao catalogDao = new CatalogDaoImp();
//        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
//        PdfWriter writer = PdfWriter.getInstance(document, buffer);
//        document.open();
//
//
////
////        htmlContext.setImageProvider(new Base64ImageProvider());
//
////        // Pipelines
////        PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
////        HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
////        CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
////
////        // XML Worker
////        XMLWorker worker = new XMLWorker(css, true);
////        XMLParser p2 = new XMLParser(worker);
////
//
//        Paragraph paragraph = new Paragraph();
//        //文章标题
//
//        Paragraph headline = new Paragraph(catalogDao.getCatalogName(id_document), title);
//        headline.setAlignment(Element.ALIGN_CENTER);
//        headline.setSpacingBefore(200);
//        headline.setSpacingAfter(350);
//        document.add(headline);
//        //文档机构（如果有）
//        String org_name = showOrgProjectDao.getOrgName(id_document);
//        System.out.println(org_name+" "+id_document);
//        if (org_name != null && org_name != "") {
//            paragraph = new Paragraph(org_name,stitle);
//            paragraph.setSpacingBefore(12);
//            paragraph.setAlignment(Element.ALIGN_CENTER);
//            paragraph.setSpacingAfter(12);
//            document.add(paragraph);
//        }
//        //导出时间
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        Date date = new Date(new java.util.Date().getTime());
//        String tmp = formatter.format(date);
//        paragraph = new Paragraph(tmp,stitle);
//        paragraph.setSpacingBefore(12);
//        paragraph.setAlignment(Element.ALIGN_CENTER);
//        paragraph.setSpacingAfter(12);
//        document.add(paragraph);
//        document.newPage();
//        //获取文档内容
//        java.util.List<CatalogEntity> catalogEntityList = catalogDao.getAll(id_document);
//        String line;
//        Paragraph lineParagraph = new Paragraph();
//        lineParagraph.setLeading(24f);
//        boolean isFirstIndex = false;
//        //目录
//        line = "目录";
//        lineParagraph = new Paragraph(line,first_index);
//        lineParagraph.setAlignment(Element.ALIGN_LEFT);
//        document.add(lineParagraph);
//        for (CatalogEntity e : catalogEntityList) {
//            line = e.getTitle() + "  ";
//            if (e.getFourth_index() != 0) {//第四级目录
//                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
//                lineParagraph = new Paragraph(line,other_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//
//            }
//            else if (e.getThird_index() != 0) {//第三级目录
//                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
//                lineParagraph = new Paragraph(line,other_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//            }
//            else if (e.getSecond_index() != 0) {//第二级目录
//                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
//                lineParagraph = new Paragraph(line, second_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//            }
//            else //第一级目录
//            {
//                line = e.getFirst_index() + "  " + line;
//                isFirstIndex = true;
//                lineParagraph = new Paragraph(line,first_index);
//                lineParagraph.setSpacingBefore(12);
//                lineParagraph.setSpacingAfter(12);
//            }
//            lineParagraph.setAlignment(Element.ALIGN_LEFT);
//            document.add(lineParagraph);
//        }
//        document.newPage();
//
//
//
//
//        //逐级生成内容
//        for (CatalogEntity e : catalogEntityList) {
//            line = e.getTitle() + "  ";
//            if (e.getFourth_index() != 0) {//第四级目录
//                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
//                lineParagraph = new Paragraph(line,other_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//
//            }
//            else if (e.getThird_index() != 0) {//第三级目录
//                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
//                lineParagraph = new Paragraph(line,other_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//            }
//            else if (e.getSecond_index() != 0) {//第二级目录
//                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
//                lineParagraph = new Paragraph(line, second_index);
//                lineParagraph.setSpacingBefore(6);
//                lineParagraph.setSpacingAfter(6);
//            }
//            else //第一级目录
//            {
//                line = e.getFirst_index() + "  " + line;
//                isFirstIndex = true;
//                lineParagraph = new Paragraph(line,first_index);
//                lineParagraph.setSpacingBefore(12);
//                lineParagraph.setSpacingAfter(12);
//            }
//            if (isFirstIndex == false)//2 3 4级目录靠左
//                lineParagraph.setAlignment(Element.ALIGN_LEFT);
//            else   lineParagraph.setAlignment(Element.ALIGN_CENTER);
//            isFirstIndex=false;
//            document.add(lineParagraph);
//            if (e.getContent() != null) {//生成不同类型的文本内容
//                if (e.getId_template() == 1) {//模板类型1
//                    CommonStructureEntity entity = gson.fromJson(e.getContent(), CommonStructureEntity.class);
//                    add2Document(document, entity.getContent(), writer);
//                }
//                if (e.getId_template() == 2) {//模板类型2
//                    UserStructureEntity entity = gson.fromJson(e.getContent(), UserStructureEntity.class);
//                    document.add(new Paragraph("用户名:" + entity.getRoleName(), black));
//                    document.add(BLANK);
//                    document.add(new Paragraph("用户描述", black));
//                    add2Document(document, entity.getDescribe(), writer);
//                    document.add(BLANK);
//                    document.add(new Paragraph("用户权限", black));
//                    add2Document(document, entity.getPermissions(), writer);
//                }
//                if (e.getId_template() == 3) {//模板类型3
//                    FunStructureEntity entity = gson.fromJson(e.getContent(), FunStructureEntity.class);
//                    String priorityName;
//                    document.add(new Paragraph("功能点名称:" + entity.getFunName(), black));
//                    document.add(BLANK);
//                    if (entity.getPriority() == 1) priorityName = "高";
//                    else if (entity.getPriority() == 2) priorityName = "中";
//                    else priorityName = "低";
//                    document.add(new Paragraph("优先级: " + priorityName, black));
//                    document.add(BLANK);
//                    document.add(new Paragraph("功能点描述: ", black));
//                    add2Document(document, entity.getDescribe(), writer);
//                    document.add(BLANK);
//                    document.add(new Paragraph("用例过程: ", black));
//                    List<FunRole> funRoleList = entity.getFunRoleList();
//                    for (int i = 0; i < funRoleList.size(); i++) {
//                        FunRole funRole = funRoleList.get(i);
//                        document.add(new Paragraph("      "+"用例过程" + (i + 1), black));
//                        if (funRole.getRoleName() != null)
//                            document.add(new Paragraph("      "+"      参与角色:" + funRole.getRoleName(), cfont));
//                        if (funRole.getRoleDescribe() != null)
//                            document.add(new Paragraph("      "+"      用例描述:  " + funRole.getRoleDescribe(), cfont));
//                        if(funRole.getUsableName() != null) {
//                            document.add(new Paragraph("      "+"      " + funRole.getUsableName(), cfont));
//                            document.add(new Paragraph("      "+"      " + funRole.getUsablePara(), cfont));
//                        }
//                        if(funRole.getSecurityName() != null) {
//                            document.add(new Paragraph("      "+"      " + funRole.getSecurityName(), cfont));
//                            document.add(new Paragraph("      "+"      " + funRole.getSecurityPara(), cfont));
//                        }
//                        document.add(BLANK);
//                    }
//                    List<FunUsable> funUsableList = entity.getFunUsableList();
//                    if (funUsableList.size() != 0) {
//                        document.add(new Paragraph("全局可用性: ", black));
//                        for (int j = 0; j < funUsableList.size(); j++) {
//                            FunUsable funUsable = funUsableList.get(j);
//                            document.add(new Paragraph("      "+"全局可用性" + (j + 1), black));
//                            document.add(new Paragraph("      "+"      "+"全局可用性名称:  " + funUsable.getUsableName(), cfont));
//                            document.add(new Paragraph("      "+"      "+"发生条件:  " + funUsable.getUsablePara(), cfont));
//                            document.add(BLANK);
//                        }
//                    }
//                    document.add(new Paragraph("输入: ", black));
//                    add2Document(document, entity.getInput(), writer);
//                    document.add(new Paragraph("输出: ", black));
//                    add2Document(document, entity.getOutput(), writer);
//                    document.add(new Paragraph("基本操作流程: ", black));
//                    add2Document(document, entity.getBasic(), writer);
//                    document.add(new Paragraph("备选操作流程: ", black));
//                    add2Document(document, entity.getAlternative(), writer);
//                }
//            }
//        }
//
//        document.close();
//
////        ITextRenderer renderer = new ITextRenderer();
////        SharedContext sharedContext = renderer.getSharedContext();
////        // 解决base64图片支持问题
////        sharedContext.setReplacedElementFactory(new B64ImgReplacedElementFactory());
////        sharedContext.getTextRenderer().setSmoothingThreshold(0);
////        renderer.setDocumentFromString(buffer.toString());
//
//        InputStream inputStream = new ByteArrayInputStream(buffer.toByteArray());
//
//        return inputStream;
//    }
//}

//有页眉页脚有中文 服务器上超时
public class Template2Pdf {


    private static final com.lowagie.text.Paragraph BLANK = new com.lowagie.text.Paragraph(" ");
    HttpServletRequest request = ServletActionContext.getRequest();
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    String basePath1 = request.getScheme()+"://"+"www.easysrs.cn";
    BaseFont stChinese =
            BaseFont.createFont(basePath+"/fonts/STSONG.TTF",BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
    com.lowagie.text.Font First_title = new com.lowagie.text.Font(stChinese, 18, Font.BOLD, new Color(0, 0, 0));//宋体三号
    com.lowagie.text.Font Second_title = new com.lowagie.text.Font(stChinese, 15, Font.BOLD, new Color(0, 0, 0));//宋体小三
    com.lowagie.text.Font Other_title = new com.lowagie.text.Font(stChinese, 14, com.lowagie.text.Font.NORMAL, new Color(0, 0, 0));//宋体四号
    com.lowagie.text.Font head_title = new com.lowagie.text.Font(stChinese, 9, Font.NORMAL, new Color(0, 0, 0));
    com.lowagie.text.Font foot_title = new com.lowagie.text.Font(stChinese, 9, Font.ITALIC, new Color(0, 0, 0));
    com.lowagie.text.Font black = new com.lowagie.text.Font(stChinese, 12, Font.NORMAL, new Color(0, 0, 0));//宋体小四
    com.lowagie.text.Font sTitle = new com.lowagie.text.Font(stChinese, 14, com.lowagie.text.Font.BOLD, new Color(0, 0, 0));//宋体四号加粗
    com.lowagie.text.Font minTitle = new com.lowagie.text.Font(stChinese, 12, com.lowagie.text.Font.BOLD, new Color(0, 0, 0));//宋体小四加粗
    com.lowagie.text.Font Title = new com.lowagie.text.Font(stChinese, 24, Font.NORMAL, new Color(0, 0, 0));//楷体小一


    public com.lowagie.text.Paragraph html2pdf(String tmpline,Document doc) throws DocumentException, IOException {
        StyleSheet ss = new StyleSheet();
        Paragraph context = new Paragraph();
        Phrase tmpPhrase = new Phrase();
        Paragraph temParagraph = new Paragraph();
        tmpline = tmpline.replaceAll("<img ","");
        tmpline = tmpline.replaceAll("src=\"","");
        //tmpline = tmpline.replaceAll("\" style=\"width: .*px;\">","");
        tmpline = tmpline.replaceAll("/disImage",basePath1+"/disImage");
        tmpline = tmpline.replaceAll(",", "1!~o#do=u-ha`o:");
        List htmlList = HTMLWorker.parseToList(new StringReader(tmpline), ss);
        for (int i = 0; i < htmlList.size(); i++) {
            com.lowagie.text.Element tmpE = (com.lowagie.text.Element) htmlList.get(i);
            String temStr = tmpE.toString();
            temStr = temStr.replaceAll(", ","");
            temStr = temStr.substring(1,temStr.length() - 1);
            temStr = temStr.replaceAll("1!~o#do=u-ha`o:",",");
            String src;
            com.lowagie.text.Image img;
            for(;temStr.length()>0;){
                int num = img_location(temStr);
                if(num==0){//图片在开头
                    src = temStr;
                    src = src.substring(src.indexOf("http://www.easysrs.cn"),src.indexOf("style")-2);
                    //src = src.substring(src.indexOf("http://"),src.indexOf("style")-2);
                    img = com.lowagie.text.Image.getInstance(src);
                    float height = img.getHeight();
                    float width = img.getWidth();
                    if(width>350){
                        float scale = 350/width;
                        width = 350;
                        height = height*scale;
                    }
                    else{
                        float scale = 350/width;
                        width = 350;
                        height = height*scale;
                    }
                    img.scaleAbsolute(width,height);
                    img.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
                    doc.add(img);
                    temStr = temStr.substring(temStr.indexOf("\">")+2,temStr.length());
                    System.out.println(temStr);
                }
                else if(num==1){//文字在开头
                    String tem1 = temStr;
                    tem1 = tem1.substring(0,temStr.indexOf("http:"));
                    temParagraph = new Paragraph("    "+tem1,black);
                    temParagraph.setLeading(24f);
                    doc.add(temParagraph);
                    temStr = temStr.substring(temStr.indexOf("http:"),temStr.length());
                }
                else {//只有文字
                    temParagraph = new Paragraph("    "+temStr,black);
                    temParagraph.setLeading(24f);
                    doc.add(temParagraph);
                    temStr="";
                }
            }
        }
        context.setLeading(24f);
        return context;
    }

    public int img_location(String temStr){
        if(temStr.indexOf("http:")==0 || temStr.indexOf("style=")==0) {//图片在开头
            return 0;
        }
        else if(temStr.indexOf("http:")!=-1){//文字在开头
            return 1;
        }
        return 2;//只有文字
    }

    public InputStream createPdf(int id_document,int doc_type) throws com.lowagie.text.DocumentException, IOException {
        //创建文档，并设置纸张大小
        Gson gson = new Gson();
        CatalogDao catalogDao = new CatalogDaoImp();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        DocumentDao documentDao = new DocumentDaoImp();
        com.lowagie.text.Document doc = new com.lowagie.text.Document(com.lowagie.text.PageSize.A4, 62, 62, 72, 72);
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(doc, buffer);
        doc.open();
        //创建段落        // CSS
        ////        CSSResolver cssResolver =
        ////                XMLWorkerHelper.getInstance().getDefaultCssResolver(true);
        ////
        ////        // HTML
        ////        HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
        ////        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
        com.lowagie.text.Paragraph paragraph = new com.lowagie.text.Paragraph();
        Paragraph linefeed1 = new Paragraph(" ",new Font(stChinese,12,Font.NORMAL,new Color(0,0,0)));
        for(int i=0;i<6;i++){
            doc.add(linefeed1);
        }
        //文档名称
        String name = catalogDao.getCatalogName(id_document);
        Paragraph p = new Paragraph(name,new Font(stChinese,26,Font.NORMAL,new Color(0,0,0)));//黑体一号
        p.setSpacingBefore(6);
        p.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
        p.setSpacingAfter(6);
        doc.add(p);
        String paperTitle = "";
        if(doc_type == 1){
            paperTitle = "远景与范围文档";
        }
        else if(doc_type == 2){
            paperTitle = "概要设计文档";
        }
        else if(doc_type == 3){
            paperTitle = "需求规格说明书";
        }
        else if(doc_type == 4){
            paperTitle = "测试计划文档";
        }
        Paragraph p1 = new Paragraph(paperTitle,new Font(stChinese,24,Font.NORMAL,new Color(0,0,0)));//楷体小一
        p1.setSpacingBefore(6);
        p1.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
        p1.setSpacingAfter(6);
        Paragraph linefeed = new Paragraph(" ",Title);
        doc.add(p1);
        doc.add(linefeed);
        //版本号
        DocumentEntity documentEntity = documentDao.getOne(id_document);
        double version = documentEntity.getVersion();
        Paragraph v = new Paragraph(String.valueOf("Version "+ version),new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));
        v.setSpacingBefore(6);
        v.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
        v.setSpacingAfter(6);
        doc.add(v);
        //换行
        for(int i=0;i<15;i++){
            doc.add(linefeed1);
        }
        //文档机构（如果有）
        String org_name = showOrgProjectDao.getOrgName(id_document);
        if (org_name != null && org_name != "") {
            paragraph = new Paragraph(org_name,new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));//黑体四号
            paragraph.setSpacingBefore(6);
            paragraph.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
            paragraph.setSpacingAfter(6);
            doc.add(paragraph);
        }
        //导出时间
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(new java.util.Date().getTime());
        String tmp = formatter.format(date);
        paragraph = new Paragraph(tmp,new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));//黑体四号
        paragraph.setSpacingBefore(6);
        paragraph.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
        paragraph.setSpacingAfter(6);
        doc.add(paragraph);
        doc.newPage();
//        //设置页眉
//        com.lowagie.text.Phrase phrase = new com.lowagie.text.Phrase(name, head_title);
//        HeaderFooter header = new HeaderFooter(phrase, false);
//        header.setAlignment(HeaderFooter.ALIGN_CENTER);
//        doc.setHeader(header);
//        //设置页脚
//        HeaderFooter footer = new HeaderFooter(new com.lowagie.text.Phrase("www.easysrs.cn                                                                                ", foot_title), true);
//        footer.setAlignment(HeaderFooter.ALIGN_LEFT);
//        doc.setFooter(footer);

        //
        java.util.List<CatalogEntity> catalogEntityList = catalogDao.getAll(id_document);
        String line;
        com.lowagie.text.Paragraph lineParagraph = new com.lowagie.text.Paragraph();
        lineParagraph.setLeading(24f);
        //
        boolean isFirstIndex = false;
        line = "目  录";
        lineParagraph = new Paragraph(line,new Font(stChinese,18,Font.BOLD,new Color(0,0,0)));
        lineParagraph.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
        lineParagraph.setSpacingBefore(12);
        lineParagraph.setSpacingAfter(12);
        doc.add(lineParagraph);
        for (CatalogEntity e : catalogEntityList) {
            line = e.getTitle() + "  ";
            if (e.getFourth_index() != 0) {//第四级目录
                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, black);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);

            } else if (e.getThird_index() != 0) {//第三级目录
                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, black);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else if (e.getSecond_index() != 0) {//第二级目录
                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, black);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else //第一级目录
            {
                line = e.getFirst_index() + "  " + line;
                isFirstIndex = true;
                lineParagraph = new com.lowagie.text.Paragraph(line, sTitle);
                lineParagraph.setSpacingBefore(12);
                lineParagraph.setSpacingAfter(12);
            }
            lineParagraph.setAlignment(Element.ALIGN_LEFT);
            doc.add(lineParagraph);
        }

        for (CatalogEntity e : catalogEntityList) {
            line = e.getTitle() + "  ";
            if (e.getFourth_index() != 0) {//第四级目录
                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, sTitle);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);

            } else if (e.getThird_index() != 0) {//第三级目录
                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, sTitle);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else if (e.getSecond_index() != 0) {//第二级目录
                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, Second_title);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else //第一级目录
            {
                doc.newPage();
                line = "第"+e.getFirst_index() + "章  " + line;
                isFirstIndex = true;
                lineParagraph = new com.lowagie.text.Paragraph(line, First_title);
                lineParagraph.setSpacingBefore(12);
                lineParagraph.setSpacingAfter(12);
            }

            if (isFirstIndex)//一级标题居中
                lineParagraph.setAlignment(Element.ALIGN_CENTER);
            else//2 3 4级目录靠左
                lineParagraph.setAlignment(Element.ALIGN_LEFT);

            doc.add(lineParagraph);
//            if(isFirstIndex)
//            {
//                doc.add(new Paragraph(" ",First_title));
//            }
//            else doc.add(new Paragraph(" ",Second_title));
            isFirstIndex = false;
            String tmpline;
            if (e.getContent() != null) {//生成不同类型的文本内容
                if (e.getId_template() == 1) {//模板类型1
                    CommonStructureEntity entity = gson.fromJson(e.getContent(), CommonStructureEntity.class);
                    tmpline = entity.getContent();
                    html2pdf(tmpline,doc);
                }
                if (e.getId_template() == 2) {//模板类型2
                    UserStructureEntity entity = gson.fromJson(e.getContent(), UserStructureEntity.class);
                    lineParagraph = new Paragraph();
                    Phrase temp = new Phrase("    "+"用 户 名：",new Font(stChinese,12,Font.BOLD));
                    Phrase temp1 = new Phrase(entity.getRoleName(),new Font(stChinese,12,Font.NORMAL));
                    lineParagraph.add(temp);
                    lineParagraph.add(temp1);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    //用户描述
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用户描述：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    html2pdf(tmpline,doc);
                    //用户权限
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用户权限：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPermissions();
                    html2pdf(tmpline,doc);
                }

                if (e.getId_template() == 3) {//模板类型3
                    FunStructureEntity entity = gson.fromJson(e.getContent(), FunStructureEntity.class);
                    String priorityName;
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "功能点名称：" + entity.getFunName(), minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    if (entity.getPriority() == 1)
                        priorityName = "高";
                    else if (entity.getPriority() == 2)
                        priorityName = "中";
                    else
                        priorityName = "低";

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "优先级：" + priorityName, minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "功能点描述：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用例过程：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<FunRole> funRoleList = entity.getFunRoleList();
                    for (int i = 0; i < funRoleList.size(); i++) {
                        FunRole funRole = funRoleList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "用例过程" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (funRole.getRoleName() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "参与角色：" + funRole.getRoleName(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (funRole.getRoleDescribe() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "用例描述：" + funRole.getRoleDescribe(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (funRole.getUsableName() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funRole.getUsableName(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funRole.getUsablePara(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (funRole.getSecurityName() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funRole.getSecurityName(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funRole.getSecurityPara(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                    List<FunUsable> funUsableList = entity.getFunUsableList();
                    if (funUsableList.size() != 0) {
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "全局可用性：", minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        for (int j = 0; j < funUsableList.size(); j++) {
                            FunUsable funUsable = funUsableList.get(j);
                            if (funUsable.getUsableName() != null) {
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "全局可用性：" + (j + 1), minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "全局可用性名称：" + funUsable.getUsableName(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funUsable.getUsablePara(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            } else {
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "全局安全性：" + (j + 1), minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "全局安全性名称：" + funUsable.getSecurityName(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funUsable.getSecurityPara(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            }
                        }

                    }
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "输入：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    String inputStr = entity.getInput();
                    html2pdf(inputStr,doc);
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "输出：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getOutput();
                    html2pdf(tmpline,doc);
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "基本操作流程：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getBasic();
                    html2pdf(tmpline,doc);
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "备选操作流程：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getAlternative();
                    html2pdf(tmpline,doc);
                }

                if (e.getId_template() == 12) {//模板类型12
                    StakeHolderEntity entity = gson.fromJson(e.getContent(), StakeHolderEntity.class);
                    List<StakeHolder> stakeHolderList = entity.getStakeHoldersList();
                    for (int i = 0; i < stakeHolderList.size(); i++) {
                        StakeHolder stakeHolder = stakeHolderList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "利益相关者" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (stakeHolder.getName() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "相关者名称：" + stakeHolder.getName(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (stakeHolder.getValue() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "关注的业务价值：" + stakeHolder.getValue(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (stakeHolder.getAttitude() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "持有的态度：" + stakeHolder.getAttitude(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (stakeHolder.getInterest() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "预期的系统特征："+ stakeHolder.getInterest(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (stakeHolder.getConstraints() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "约束："+ stakeHolder.getConstraints(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                }

                if (e.getId_template() == 13) {//模板类型13
                    ProgramConstraint entity = gson.fromJson(e.getContent(), ProgramConstraint.class);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目功能范围：" , minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getFeatures();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目质量约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getQuality();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目进度约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getSchedule();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目成本约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getCost();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目团队约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getStaff();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "其他约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<Constraint> constraintList = entity.getConstraintList();
                    for (int i = 0; i < constraintList.size(); i++) {
                        Constraint constraint = constraintList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "其他约束" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (constraint.getTitle() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "约束项：" + constraint.getTitle(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (constraint.getContent() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "具体内容：" + constraint.getContent(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                }

                if (e.getId_template() == 14) {//模板类型14
                    Release entity = gson.fromJson(e.getContent(), Release.class);
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "迭代构件：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<Feature> featureList = entity.getFeatureList();
                    for (int i = 0; i < featureList.size(); i++) {
                        Feature feature = featureList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "系统功能" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (feature.getNumber() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "功能编号：" + feature.getNumber(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (feature.getTitle() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "功能名称：" + feature.getTitle(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (feature.getContent() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "功能描述：" + feature.getContent(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                }

                if (e.getId_template() == 16) {//模板类型16
                    TestEntity entity = gson.fromJson(e.getContent(), TestEntity.class);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "功能描述：" , minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用例目的：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPurpose();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "前提条件：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPremise();
                    html2pdf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "测试用例：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<TestCase> testCaseList = entity.getTestCaseList();
                    for (int i = 0; i < testCaseList.size(); i++) {
                        TestCase testCase = testCaseList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "测试用例" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (testCase.getNumber() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "用例编号：" + testCase.getNumber(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (testCase.getTitle() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "用例名称：" + testCase.getTitle(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (testCase.getInput() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "输入：" + testCase.getInput(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (testCase.getOutput() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "期望输出：" + testCase.getOutput(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (testCase.getContent() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "备注：" + testCase.getContent(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                }

            }
        }
//        com.lowagie.text.Image img = com.lowagie.text.Image.getInstance("D:/SAO.jpg");
//        img.scalePercent(30);
//        doc.add(img);
        doc.close();

        InputStream inputStream = new ByteArrayInputStream(buffer.toByteArray());
        return inputStream;
    }

    public Template2Pdf() throws IOException, DocumentException {
    }

    public com.lowagie.text.pdf.BaseFont getstChinese() {
        return stChinese;
    }

    public void setstChinese(com.lowagie.text.pdf.BaseFont stChinese) {
        this.stChinese = stChinese;
    }
}