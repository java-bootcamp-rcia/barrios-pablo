package Topic_0.Factory;


public class FactoryConnection {

    public NewConnection getConnection(String engine){
        if(engine==null){
            return new EmptyConnection();
        }
        if(engine.equalsIgnoreCase("MySQL")){
            return new ConnectionMySQL();
        }else if(engine.equalsIgnoreCase("ORACLE")){
            return new ConnectionORACLE();
        }else if(engine.equalsIgnoreCase("SQL")){
            return new ConnectionSQL();
        }

        return new EmptyConnection();
    }
}
