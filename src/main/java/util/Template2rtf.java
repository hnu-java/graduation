package util;

import java.awt.Color;
import java.io.IOException;
import com.google.gson.Gson;
import com.itextpdf.text.Element;
import com.itextpdf.tool.xml.html.head.Title;
import com.lowagie.text.*;
import com.lowagie.text.pdf.draw.LineSeparator;
import com.lowagie.text.rtf.RtfWriter2;
import com.lowagie.text.html.simpleparser.HTMLWorker;
import com.lowagie.text.html.simpleparser.StyleSheet;
import dao.CatalogDao;
import dao.DocumentDao;
import dao.ShowOrgProjectDao;
import daoImp.CatalogDaoImp;
import daoImp.DocumentDaoImp;
import daoImp.ShowOrgProjectDaoImp;
import entity.*;
import java.io.*;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.lowagie.text.pdf.BaseFont;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

public class Template2rtf {
    HttpServletRequest request = ServletActionContext.getRequest();
    String path = request.getContextPath();
    String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    private static final com.lowagie.text.Paragraph BLANK = new com.lowagie.text.Paragraph(" ");
    BaseFont stChinese;
//    BaseFont stChinese =
//            BaseFont.createFont(basePath1+"/fonts/simsun.ttc,0",BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
    Font First_title = new Font(stChinese, 18, Font.NORMAL, new Color(0,0,0));
    Font Second_title = new Font(stChinese, 7, Font.BOLD,new Color(0,0,0));
    Font black = new Font(stChinese, 12, Font.NORMAL,new Color(0,0,0));//小四
    Font sTitle = new Font(stChinese, 14, Font.BOLD,new Color(0,0,0));//四号
    Font minTitle = new Font(stChinese, 12, Font.BOLD,new Color(0,0,0));
    String basePath = request.getScheme()+"://"+"www.easysrs.cn";

    public Paragraph html2rtf(String tmpline,Document doc) throws DocumentException, IOException {
        StyleSheet ss = new StyleSheet();
        Paragraph context = new Paragraph();
        Phrase tmpPhrase = new Phrase();
        Paragraph temParagraph = new Paragraph();
        tmpline = tmpline.replaceAll("<img ","");
        tmpline = tmpline.replaceAll("src=\"","");
        //tmpline = tmpline.replaceAll("\" style=\"width: .*px;\">","");
        tmpline = tmpline.replaceAll("/disImage",basePath+"/disImage");
        tmpline = tmpline.replaceAll(",", "1!~o#do=u-ha`o:");
        //System.out.println(tmpline);
        List htmlList = HTMLWorker.parseToList(new StringReader(tmpline), ss);
        for (int i = 0; i < htmlList.size(); i++) {
            com.lowagie.text.Element tmpE = (com.lowagie.text.Element) htmlList.get(i);
            String temStr = tmpE.toString();
            temStr = temStr.replaceAll(", ","");
            temStr = temStr.substring(1,temStr.length() - 1);
            temStr = temStr.replaceAll("1!~o#do=u-ha`o:",",");
            for(;temStr.length()>0;){
                int num = img_location(temStr);
                if(num==0){//图片在开头
                    //System.out.println(temStr);
                    String src = temStr;
                    src = src.substring(src.indexOf("http://www.easysrs.cn"),src.indexOf("style")-2);
                    com.lowagie.text.Image img = com.lowagie.text.Image.getInstance(src);
                    float height = img.getHeight();
                    float width = img.getWidth();
                    if(width>400){
                        float scale = 400/width;
                        width = 400;
                        height = height*scale;
                    }
                    else{
                        float scale = 400/width;
                        width = 400;
                        height = height*scale;
                    }
                    img.scaleAbsolute(width,height);
                    img.setAlignment(Element.ALIGN_CENTER);
                    doc.add(img);
                    temStr = temStr.substring(temStr.indexOf("\">")+2,temStr.length());
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
            Paragraph tmpLineParagraph = new Paragraph("    "+"    "+temStr,black);
            context.add(tmpLineParagraph);
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

    public InputStream createRtf(int id_document,int doc_type) throws DocumentException, IOException {
        //创建文档，并设置纸张大小
        Gson gson = new Gson();
        CatalogDao catalogDao = new CatalogDaoImp();
        ShowOrgProjectDao showOrgProjectDao = new ShowOrgProjectDaoImp();
        DocumentDao documentDao = new DocumentDaoImp();
        Document doc = new Document(PageSize.A4, 62, 62, 72,72);
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        RtfWriter2 writer = RtfWriter2.getInstance(doc,buffer);
        doc.open();
        //创建段落        // CSS
        ////        CSSResolver cssResolver =
        ////                XMLWorkerHelper.getInstance().getDefaultCssResolver(true);
        ////
        ////        // HTML
        ////        HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
        ////        htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
        Paragraph paragraph = new Paragraph();
        Paragraph linefeed1 = new Paragraph("",new Font(stChinese,12,Font.NORMAL,new Color(0,0,0)));
        for(int i=0;i<8;i++){
            doc.add(linefeed1);
        }
        //文档名称
        String name = catalogDao.getCatalogName(id_document);
        Paragraph p = new Paragraph(name,new Font(stChinese,26,Font.NORMAL,new Color(0,0,0)));//黑体一号
        p.setSpacingBefore(6);
        p.setAlignment(Element.ALIGN_RIGHT);
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
        p1.setAlignment(Element.ALIGN_RIGHT);
        p1.setSpacingAfter(6);
        Paragraph linefeed = new Paragraph("",new Font(stChinese,24,Font.NORMAL,new Color(0,0,0)));
        p1.add(linefeed);
        doc.add(p1);
        //版本号
        DocumentEntity documentEntity = documentDao.getOne(id_document);
        double version = documentEntity.getVersion();
        Paragraph v = new Paragraph(String.valueOf("Version "+ version),new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));
        v.setSpacingBefore(6);
        v.setAlignment(Element.ALIGN_RIGHT);
        v.setSpacingAfter(6);
        doc.add(v);
        //换行
        for(int i=0;i<17;i++){
            doc.add(linefeed1);
        }
        //文档机构（如果有）
        String org_name = showOrgProjectDao.getOrgName(id_document);
        //System.out.println(org_name+" "+id_document);
        if (org_name != null && org_name != "") {
            paragraph = new Paragraph(org_name,new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));
            paragraph.setSpacingBefore(6);
            paragraph.setAlignment(Element.ALIGN_RIGHT);
            paragraph.setSpacingAfter(6);
            doc.add(paragraph);
        }
        //导出时间
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date(new java.util.Date().getTime());
        String tmp = formatter.format(date);
        paragraph = new Paragraph(tmp,new Font(stChinese,14,Font.NORMAL,new Color(0,0,0)));
        paragraph.setSpacingBefore(6);
        paragraph.setAlignment(Element.ALIGN_RIGHT);
        paragraph.setSpacingAfter(6);
        doc.add(paragraph);
        doc.newPage();
        //设置页眉
        Phrase phrase = new Phrase(name,new Font(Font.NORMAL,9,Font.HELVETICA,new Color(0,0,0)));
        Phrase phrase1 = new Phrase("\n————————————————————————————————————————————————————————————————————————————————",new Font(Font.NORMAL,9,Font.HELVETICA,new Color(0,0,0)));
        phrase.add(phrase1);
        HeaderFooter header = new HeaderFooter(phrase,false);
        header.setAlignment(HeaderFooter.ALIGN_CENTER);
        doc.setHeader(header);
        //设置页脚
        HeaderFooter footer = new HeaderFooter(new Phrase("www.easysrs.cn                                    ",new Font(Font.NORMAL,9,Font.ITALIC,new Color(0,0,0))),true);
        footer.setAlignment(HeaderFooter.ALIGN_LEFT);
        doc.setFooter(footer);

        //
        java.util.List<CatalogEntity> catalogEntityList = catalogDao.getAll(id_document);
        String line;
        Paragraph lineParagraph = new Paragraph();
        lineParagraph.setLeading(24f);
        //
        boolean isFirstIndex = false;
        line = "目  录";
        lineParagraph = new Paragraph(line,new Font(stChinese,18,Font.BOLD,new Color(0,0,0)));
        lineParagraph.setAlignment(Element.ALIGN_CENTER);
        lineParagraph.setSpacingBefore(12);
        lineParagraph.setSpacingAfter(12);
        doc.add(lineParagraph);
        for (CatalogEntity e : catalogEntityList) {
            line = e.getTitle() + "  ";
            if (e.getFourth_index() != 0) {//第四级目录
                line = "     " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
                lineParagraph = new Paragraph(line,new Font(stChinese,12,Font.NORMAL,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);

            }
            else if (e.getThird_index() != 0) {//第三级目录
                line = "    " + e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
                lineParagraph = new Paragraph(line,new Font(stChinese,12,Font.NORMAL,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            }
            else if (e.getSecond_index() != 0) {//第二级目录
                line = "  " + e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
                lineParagraph = new Paragraph(line, new Font(stChinese, 12, Font.NORMAL, new Color(0, 0, 0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            }
            else //第一级目录
            {
                line = e.getFirst_index() + "  " + line;
                isFirstIndex = true;
                lineParagraph = new Paragraph(line,new Font(stChinese,14,Font.BOLD,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(12);
                lineParagraph.setSpacingAfter(12);
            }
            lineParagraph.setAlignment(Element.ALIGN_LEFT);
            doc.add(lineParagraph);
        }

        for (CatalogEntity e : catalogEntityList) {
            line = e.getTitle() + "  ";
            if (e.getFourth_index() != 0) {//第四级目录
                line = e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "." + e.getFourth_index() + "  " + line;
                lineParagraph = new Paragraph(line,new Font(stChinese,14,Font.BOLD,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);

            }
            else if (e.getThird_index() != 0) {//第三级目录
                line = e.getFirst_index() + "." + e.getSecond_index() + "." + e.getThird_index() + "  " + line;
                lineParagraph = new Paragraph(line,new Font(stChinese,14,Font.BOLD,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            }
            else if (e.getSecond_index() != 0) {//第二级目录
                line = e.getFirst_index() + "." + e.getSecond_index() + "  " + line;
                lineParagraph = new Paragraph(line, new Font(stChinese, 15, Font.BOLD, new Color(0, 0, 0)));
                lineParagraph.setSpacingBefore(6);
                lineParagraph.setSpacingAfter(6);
            }
            else //第一级目录
            {
                doc.newPage();
                line = "第"+e.getFirst_index() + "章  " + line;
                isFirstIndex = true;
                lineParagraph = new Paragraph(line,new Font(stChinese,18,Font.BOLD,new Color(0,0,0)));
                lineParagraph.setSpacingBefore(12);
                lineParagraph.setSpacingAfter(12);
            }

            if (isFirstIndex)//一级标题居中
                lineParagraph.setAlignment(Element.ALIGN_CENTER);
            else//2 3 4级目录靠左
                lineParagraph.setAlignment(Element.ALIGN_LEFT);

            doc.add(lineParagraph);

            isFirstIndex=false;
            String tmpline;
            if (e.getContent() != null) {//生成不同类型的文本内容
                if (e.getId_template() == 1) {//模板类型1
                    CommonStructureEntity entity = gson.fromJson(e.getContent(), CommonStructureEntity.class);
                    tmpline = entity.getContent();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
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
                    lineParagraph = new Paragraph("    "+"用户描述：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
                    //用户权限
                    lineParagraph = new Paragraph("    "+"用户权限：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPermissions();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
                }

                if (e.getId_template() == 3) {//模板类型3
                    FunStructureEntity entity = gson.fromJson(e.getContent(), FunStructureEntity.class);
                    String priorityName;
                    lineParagraph = new Paragraph("    "+"功能点名称：" + entity.getFunName(),minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    if (entity.getPriority() == 1)
                        priorityName = "高";
                    else if (entity.getPriority() == 2)
                        priorityName = "中";
                    else
                        priorityName = "低";

                    lineParagraph = new Paragraph("    "+"优先级：" + priorityName,minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);

                    lineParagraph = new Paragraph("    "+"功能点描述：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getDescribe();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);

                    lineParagraph = new Paragraph("    "+"用例过程：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    List<FunRole> funRoleList = entity.getFunRoleList();
                    for (int i = 0; i < funRoleList.size(); i++) {
                        FunRole funRole = funRoleList.get(i);
                        lineParagraph = new Paragraph("    "+"    "+"用例过程" + (i + 1),minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        if (funRole.getRoleName() != null){
                            lineParagraph = new Paragraph("    "+"    "+"    "+"参与角色：" + funRole.getRoleName(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if (funRole.getRoleDescribe() != null){
                            lineParagraph = new Paragraph("    "+"    "+"    "+"用例描述：" + funRole.getRoleDescribe(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if(funRole.getUsableName() != null) {
                            lineParagraph = new Paragraph("    "+"    "+"    "+funRole.getUsableName(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                            lineParagraph = new Paragraph("    "+"    "+"    "+funRole.getUsablePara(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                        if(funRole.getSecurityName() != null) {
                            lineParagraph = new Paragraph("    "+"    "+"    "+funRole.getSecurityName(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                            lineParagraph = new Paragraph("    "+"    "+"    "+funRole.getSecurityPara(),black);
                            lineParagraph.setLeading(24f);
                            doc.add(lineParagraph);
                        }
                    }
                    List<FunUsable> funUsableList = entity.getFunUsableList();
                    if (funUsableList.size() != 0) {
                        lineParagraph = new Paragraph("    "+"全局可用性：",minTitle);
                        lineParagraph.setLeading(24f);
                        doc.add(lineParagraph);
                        for (int j = 0; j < funUsableList.size(); j++) {
                            FunUsable funUsable = funUsableList.get(j);
                            if(funUsable.getUsableName() != null){
                                lineParagraph = new Paragraph("    "+"    "+"全局可用性：" + (j + 1),minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new Paragraph("    "+"    "+"    "+"全局可用性名称：" + funUsable.getUsableName(),black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new Paragraph("    "+"    "+"    " + funUsable.getUsablePara(),black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            }
                            else{
                                lineParagraph = new Paragraph("    "+"    "+"全局安全性：" + (j + 1),minTitle);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new Paragraph("    "+"    "+"    "+"全局安全性名称：" + funUsable.getSecurityName(),black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                                lineParagraph = new Paragraph("    "+"    "+"    " + funUsable.getSecurityPara(),black);
                                lineParagraph.setLeading(24f);
                                doc.add(lineParagraph);
                            }
                        }

                    }
                    lineParagraph = new Paragraph("    "+"输入：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    String inputStr = entity.getInput();
                    //doc.add(html2rtf(inputStr));
                    html2rtf(inputStr,doc);
                    lineParagraph = new Paragraph("    "+"输出：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getOutput();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
                    lineParagraph = new Paragraph("    "+"基本操作流程：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getBasic();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
                    lineParagraph = new Paragraph("    "+"备选操作流程：",minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getAlternative();
                    //doc.add(html2rtf(tmpline));
                    html2rtf(tmpline,doc);
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
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目质量约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getQuality();
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目进度约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getSchedule();
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目成本约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getCost();
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "项目团队约束：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getStaff();
                    html2rtf(tmpline,doc);

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
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "用例目的：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPurpose();
                    html2rtf(tmpline,doc);

                    lineParagraph = new com.lowagie.text.Paragraph("    " + "前提条件：", minTitle);
                    lineParagraph.setLeading(24f);
                    doc.add(lineParagraph);
                    tmpline = entity.getPremise();
                    html2rtf(tmpline,doc);

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
//        com.lowagie.text.Image img = com.lowagie.text.Image.getInstance(basePath+"/disImage/20180913/20180913171005_965.png");
//        doc.add(img);
        doc.close();

        InputStream inputStream = new ByteArrayInputStream(buffer.toByteArray());
        return inputStream;
    }

    public Template2rtf() throws IOException, DocumentException {
    }

    public BaseFont getstChinese() {
        return stChinese;
    }

    public void setstChinese(BaseFont stChinese) {
        this.stChinese = stChinese;
    }
}