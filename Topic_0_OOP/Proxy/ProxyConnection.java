package Topic_0.ProxyDesign;

public class ProxyConnection {

    public IConnection getConnection(String engine) {


        if (engine.equalsIgnoreCase("MySQL")) {
            return new ProxyMySQL();
        }else return null;
    }
}