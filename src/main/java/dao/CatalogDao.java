package dao;

import entity.CatalogEntity;

import java.util.List;

/**
 * Created by DELL on 2017/12/12.
 *
 * @author MJY
 */
public interface CatalogDao  {
List<CatalogEntity> getAllIndex(int id_document);

void insert(int id_template,int id_document,String title,int first,int second,int third,int fourth);

void update(int id_document, int first);

void update(int id_document, int first, int second);

    void update(int id_document, int first, int second, int third);

    void update(int id_document, int first, int second, int third, int fourth);

    void up(int id_document, int first);

    void up(int id_document, int first, int second);

    void up(int id_document, int first, int second, int third);

    void up(int id_document, int first, int second, int third, int fourth);

    void down(int id_document, int first);

    void down(int id_document, int first, int second);

    void down(int id_document, int first, int second, int third);

    void down(int id_document, int first, int second, int third, int fourth);

    void newCatalog(int id_document,String title,int id_template);

    CatalogEntity getOne(int id_document,int first,int second,int third,int fourth);

    int getIdCatalog(int id_document,int first,int second,int third,int fourth);

    void rename(String title,int id_document,int first,int second,int third,int fourth);

    int getRoleCount(int id_document);

    void saveContent(int id_catalog,String content);

    List<CatalogEntity> getAllRole(int id_document);

    List<CatalogEntity> getAll(int id_document);

    String getCatalogName(int id_document);

    String getCatalogTitle(int id_pro_discuss);

    List<CatalogEntity> getAllByDocument(int id_document);

    void saveLib(int id_user,int id_template,String content);
}
