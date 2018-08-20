package listener;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.http.*;

public class OnlineUserListener implements HttpSessionListener,HttpSessionBindingListener {
    private static HashMap hUserName = new HashMap();//保存sessionID和username的映射

    public void sessionCreated(HttpSessionEvent event) {
    }

    public void sessionDestroyed(HttpSessionEvent event) {
        hUserName.remove( event.getSession().getId() );
    }

    public static boolean isAlreadyEnter(HttpSession session,String sUserName){
        boolean flag = false;
        if(hUserName.containsValue(sUserName)){//如果该用户已经登录过，则使上次登录的用户掉线(依据使用户名是否在hUserName中
            flag = true;
        //遍历原来的hUserName，删除原用户名对应的sessionID(即删除原来的sessionID和username)
        Iterator iter = hUserName.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry)iter.next();
            Object key = entry.getKey();
            Object val = entry.getValue();
            if( ( (String)val ).equals(sUserName) ){
                hUserName.remove(key);
            }
        }
        hUserName.put( session.getId(),sUserName );//添加现在的sessionID和username
        System.out.println("hUserName = " + hUserName);
        }
        else{//如果该用户没登录过，直接添加现在的sessionID和username
        flag = false;
        hUserName.put( session.getId(),sUserName );
        System.out.println("hUserName = " + hUserName);
        }
    return flag;
    }

    public static boolean isOnline(HttpSession session){
        boolean flag = true;
        if( hUserName.containsKey( session.getId() ) ){
            flag = true;
        }
        else{
            flag = false;
        }
        return flag;
    }

    public static boolean isOnline(String userName){
        boolean flag = false;
        if(hUserName.containsValue(userName)){
            flag = true;
        }
        return flag;
    }

    public static void deleteCurUserSession(String userName){

        Iterator iter = hUserName.entrySet().iterator();
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry)iter.next();
            Object key = entry.getKey();
            Object val = entry.getValue();
            if( ( (String)val ).equals(userName)){
                hUserName.remove(key);
            }
        }
    }

    public void valueBound(HttpSessionBindingEvent e) {

    }

    public void valueUnbound(HttpSessionBindingEvent e) {
        deleteCurUserSession(e.getName());
    }

}
