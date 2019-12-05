package Topic_0.ProxyDesign;

public class Proxy {
    public static void main(String[] args){

        IConnection conn=new ProxyMySQL();
        conn.connect();
        conn.disconnect();
    }
}
