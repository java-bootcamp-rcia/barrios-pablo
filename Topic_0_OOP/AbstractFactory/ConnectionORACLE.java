package Topic_0.Factory;

public class ConnectionORACLE implements NewConnection {
    private String host;
    private String port;
    private String user;
    private String password;

    public ConnectionORACLE() {
        this.host = "localhost";
        this.port = "1521";
        this.user = "admin";
        this.password = "1234";
    }


    @Override
    public void connect() {
        System.out.println("connected to ORACLE");

    }

    @Override
    public void disconnect() {
        System.out.println("disconnected to ORACLE");

    }

    @Override
    public String toString() {
        return "ConnectionORACLE [host=" + host + ", port=" + port + ", user=" + user + ", password="
                + password + "]";
    }
}
