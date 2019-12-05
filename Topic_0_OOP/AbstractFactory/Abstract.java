package Topic_0.Factory;

public class Abstract {
    public static void main(String[] args){
        FactoryConnection factory=new FactoryConnection();


        NewConnection connection1=factory.getConnection("ORACLE");
        connection1.connect();
        connection1.disconnect();

        NewConnection connection2=factory.getConnection("MYSQL");
        connection2.connect();
        connection2.disconnect();

        NewConnection connection3=factory.getConnection("SQL");
        connection3.connect();
        connection3.disconnect();

        NewConnection connection4=factory.getConnection("");
        connection4.connect();
        connection4.disconnect();
    }
}
