package util;

/**
 * Created by ${mjy} on 2018/4/17.
 */

import com.google.gson.Gson;
import com.lowagie.text.*;
import com.lowagie.text.Font;
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
import dao.ShowOrgProjectDao;
import daoImp.CatalogDaoImp;
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
//    BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
//    Font title = new Font(bfChinese, 24, Font.NORMAL, BaseColor.BLACK);
//    Font stitle = new Font(bfChinese, 14, Font.NORMAL, BaseColor.BLACK);
//    Font first_index = new Font(bfChinese, 18, Font.NORMAL, BaseColor.BLACK);
//    Font second_index = new Font(bfChinese, 15, Font.NORMAL, BaseColor.BLACK);
//    Font other_index = new Font(bfChinese, 14, Font.NORMAL, BaseColor.BLACK);
//    Font catalog = new Font(bfChinese, 16, Font.BOLD, BaseColor.BLACK);
//    Font black = new Font(bfChinese, 12, Font.BOLD, BaseColor.BLACK);
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
//            FontChinese = new Font(bfChinese, 12, Font.NORMAL);
//            if (FontChinese == null) {
//                FontChinese = super.getFont(fontname, encoding, size, style);
//            }
//            return FontChinese;
//        }
//    }
//
//    private void add2Document(Document document, String line, PdfWriter writer) throws DocumentException, IOException {
//        Font cfont = new Font(bfChinese);
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
//        BaseFont bfChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
//        Font cfont = new Font(bfChinese);
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

//有页眉页脚无中文
public class Template2Pdf {


    private static final com.lowagie.text.Paragraph BLANK = new com.lowagie.text.Paragraph(" ");
    HttpServletRequest request = ServletActionContext.getRequest();
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    BaseFont bfChinese =
            BaseFont.createFont(basePath+"fonts/STSONG.TTF",BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
    com.lowagie.text.Font First_title = new com.lowagie.text.Font(bfChinese, 18, com.lowagie.text.Font.NORMAL, new Color(0, 0, 0));
    com.lowagie.text.Font Second_title = new com.lowagie.text.Font(bfChinese, 15, com.lowagie.text.Font.NORMAL, new Color(0, 0, 0));
    com.lowagie.text.Font Other_title = new com.lowagie.text.Font(bfChinese, 14, com.lowagie.text.Font.NORMAL, new Color(0, 0, 0));
    com.lowagie.text.Font head_title = new com.lowagie.text.Font(bfChinese, 9, Font.NORMAL, new Color(0, 0, 0));
    com.lowagie.text.Font foot_title = new com.lowagie.text.Font(bfChinese, 9, Font.ITALIC, new Color(0, 0, 0));
    com.lowagie.text.Font black = new com.lowagie.text.Font(bfChinese, 12, com.lowagie.text.Font.COURIER, new Color(0, 0, 0));
    com.lowagie.text.Font sTitle = new com.lowagie.text.Font(bfChinese, 14, com.lowagie.text.Font.BOLD, new Color(0, 0, 0));
    com.lowagie.text.Font minTitle = new com.lowagie.text.Font(bfChinese, 12, com.lowagie.text.Font.BOLD, new Color(0, 0, 0));
    com.lowagie.text.Font Title = new com.lowagie.text.Font(bfChinese, 24, com.lowagie.text.Font.BOLD, new Color(0, 0, 0));


    public com.lowagie.text.Paragraph html2pdf(String tmpline) throws DocumentException, IOException {
        StyleSheet ss = new StyleSheet();
        com.lowagie.text.Paragraph context = new com.lowagie.text.Paragraph();
        Phrase tmpPhrase = new Phrase();
        Paragraph temParagraph = new Paragraph();
        tmpline = tmpline.replaceAll("<img src=\"","");
        //tmpline = tmpline.replaceAll("\" style=\"width: .*px;\">","");
        tmpline = tmpline.replaceAll("/disImage",basePath+"/disImage");
        tmpline = tmpline.replaceAll(",", "1!~o#do=u-ha`o:");
        List htmlList = HTMLWorker.parseToList(new StringReader(tmpline), ss);
        for (int i = 0; i < htmlList.size(); i++) {
            com.lowagie.text.Element tmpE = (com.lowagie.text.Element) htmlList.get(i);
            String temStr = tmpE.toString();
            temStr = temStr.replaceAll(", ", "");
            temStr = temStr.substring(1, temStr.length() - 1);
            temStr = temStr.replaceAll("1!~o#do=u-ha`o:", ",");
            for(;temStr.length()!=0;){
                int num = img_location(temStr);
                if(num==0){//图片在开头
                    String src = temStr;
                    src = src.substring(src.indexOf("http"),src.indexOf("style")-2);
                    com.lowagie.text.Image img = com.lowagie.text.Image.getInstance(src);
                    img.scaleAbsolute(300,200);
                    context.add(img);
                    temStr = temStr.substring(temStr.indexOf("px;\">")+5,temStr.length());
                }
                else if(num==1){//文字在开头
                    String tem1 = temStr;
                    String tem2 = temStr;
                    tem1 = tem1.substring(0,temStr.indexOf("http:"));
                    temParagraph = new Paragraph("    "+tem1,black);
                    context.add(temParagraph);
                    temStr = temStr.substring(temStr.indexOf("http:"),temStr.length());
                }
                else {//只有文字
                    temParagraph = new Paragraph("    "+temStr,black);
                    context.add(temParagraph);
                    temStr="";
                }
            }
            com.lowagie.text.Paragraph tmpLineParagraph = new com.lowagie.text.Paragraph("    " + "    " + temStr, black);
            context.add(tmpLineParagraph);
        }
        context.setLeading(24f);
        return context;
    }

    public int img_location(String temStr){
        if(temStr.indexOf("http:")==0) {//图片在开头
            return 0;
        }
        else if(temStr.indexOf("http:")!=-1){//文字在开头
            return 1;
        }
        return 2;//只有文字
    }

    public InputStream createPdf(int id_document) throws com.lowagie.text.DocumentException, IOException {
        //创建文档，并设置纸张大小
        Gson gson = new Gson();
        CatalogDao catalogDao = new CatalogDaoImp();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
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

        //文档名称
        String name = catalogDao.getCatalogName(id_document);
        com.lowagie.text.Paragraph p = new com.lowagie.text.Paragraph(name, Title);
        //com.lowagie.text.Paragraph p = new com.lowagie.text.Paragraph(name, title);
        p.setSpacingBefore(200);
        p.setAlignment(Element.ALIGN_CENTER);
        p.setSpacingAfter(300);
        doc.add(p);
        //文档机构（如果有）
        String org_name = showOrgProjectDao.getOrgName(id_document);
        System.out.println(org_name + " " + id_document);
        if (org_name != null && org_name != "") {
            paragraph = new com.lowagie.text.Paragraph(org_name, sTitle);
            paragraph.setSpacingBefore(12);
            paragraph.setAlignment(Element.ALIGN_CENTER);
            paragraph.setSpacingAfter(12);
            doc.add(paragraph);
        }
        //导出时间
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(new java.util.Date().getTime());
        String tmp = formatter.format(date);
        paragraph = new com.lowagie.text.Paragraph(tmp, sTitle);
        paragraph.setSpacingBefore(12);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.setSpacingAfter(12);
        doc.add(paragraph);
        doc.newPage();
        //设置页眉
        com.lowagie.text.Phrase phrase = new com.lowagie.text.Phrase(name, head_title);
        HeaderFooter header = new HeaderFooter(phrase, false);
        header.setAlignment(HeaderFooter.ALIGN_CENTER);
        doc.setHeader(header);
        //设置页脚
        HeaderFooter footer = new HeaderFooter(new com.lowagie.text.Phrase("www.easysrs.cn                                      ", foot_title), true);
        footer.setAlignment(HeaderFooter.ALIGN_LEFT);
        doc.setFooter(footer);

        //
        java.util.List<CatalogEntity> catalogEntityList = catalogDao.getAll(id_document);
        String line;
        com.lowagie.text.Paragraph lineParagraph = new com.lowagie.text.Paragraph();
        lineParagraph.setLeading(24f);
        //
        boolean isFirstIndex = false;
        line = "目录";
        lineParagraph = new com.lowagie.text.Paragraph(line, First_title);
        lineParagraph.setAlignment(Element.ALIGN_LEFT);
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
                lineParagraph = new com.lowagie.text.Paragraph(line, Other_title);
                lineParagraph.setSpacingBefore(12);
                lineParagraph.setSpacingAfter(12);
            }
            lineParagraph.setAlignment(Element.ALIGN_LEFT);
            doc.add(lineParagraph);
        }
        doc.newPage();

        for (CatalogEntity e : catalogEntityList) {
            line = e.getTitle() + "  ";
            if (e.getFourth_index() != 0) {//第四级目录
                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, Other_title);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);

            } else if (e.getThird_index() != 0) {//第三级目录
                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, Other_title);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else if (e.getSecond_index() != 0) {//第二级目录
                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
                lineParagraph = new com.lowagie.text.Paragraph(line, Second_title);
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            } else //第一级目录
            {
                line = e.getFirst_index() + "  " + line;
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
                    doc.add(html2pdf(tmpline));
                }
                if (e.getId_template() == 2) {//模板类型2
                    UserStructureEntity entity = gson.fromJson(e.getContent(), UserStructureEntity.class);
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用户名:" + entity.getRoleName(), sTitle);
                    doc.add(lineParagraph);
                    doc.add(BLANK);
                    //用户描述
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用户描述:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    doc.add(html2pdf(tmpline));
                    //用户权限
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用户权限:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getPermissions();
                    doc.add(html2pdf(tmpline));
                }

                if (e.getId_template() == 3) {//模板类型3
                    FunStructureEntity entity = gson.fromJson(e.getContent(), FunStructureEntity.class);
                    String priorityName;
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "功能点名称:" + entity.getFunName(), sTitle);
                    doc.add(lineParagraph);
                    doc.add(BLANK);
                    if (entity.getPriority() == 1)
                        priorityName = "高";
                    else if (entity.getPriority() == 2)
                        priorityName = "中";
                    else
                        priorityName = "低";

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "优先级:" + priorityName, sTitle);
                    doc.add(lineParagraph);
                    doc.add(BLANK);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "功能点描述:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    doc.add(html2pdf(tmpline));
                    doc.add(BLANK);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用例过程:", sTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<FunRole> funRoleList = entity.getFunRoleList();
                    for (int i = 0; i < funRoleList.size(); i++) {
                        FunRole funRole = funRoleList.get(i);
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "用例过程" + (i + 1), minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (funRole.getRoleName() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "参与角色:" + funRole.getRoleName(), black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (funRole.getRoleDescribe() != null) {
                            lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "用例描述:" + funRole.getRoleDescribe(), black);
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
                        doc.add(BLANK);
                    }
                    List<FunUsable> funUsableList = entity.getFunUsableList();
                    if (funUsableList.size() != 0) {
                        lineParagraph = new com.lowagie.text.Paragraph("    " + "全局可用性:", sTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        for (int j = 0; j < funUsableList.size(); j++) {
                            FunUsable funUsable = funUsableList.get(j);
                            if (funUsable.getUsableName() != null) {
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "全局可用性:" + (j + 1), minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "全局可用性名称:" + funUsable.getUsableName(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funUsable.getUsablePara(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            } else {
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "全局安全性:" + (j + 1), minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + "全局安全性名称:" + funUsable.getSecurityName(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new com.lowagie.text.Paragraph("    " + "    " + "    " + funUsable.getSecurityPara(), black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            }
                            doc.add(BLANK);
                        }

                    }
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "输入:", sTitle);
                    doc.add(lineParagraph);
                    String inputStr = entity.getInput();
                    doc.add(html2pdf(inputStr));
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "输出:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getOutput();
                    doc.add(html2pdf(tmpline));
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "基本操作流程:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getBasic();
                    doc.add(html2pdf(tmpline));
                    lineParagraph = new com.lowagie.text.Paragraph("    " + "备选操作流程:", sTitle);
                    doc.add(lineParagraph);
                    tmpline = entity.getAlternative();
                    doc.add(html2pdf(tmpline));
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

    public Template2Pdf() throws IOException, com.lowagie.text.DocumentException, DocumentException {
    }

    public com.lowagie.text.pdf.BaseFont getBfChinese() {
        return bfChinese;
    }

    public void setBfChinese(com.lowagie.text.pdf.BaseFont bfChinese1) {
        this.bfChinese = bfChinese;
    }
}