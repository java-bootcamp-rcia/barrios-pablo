package Topic_0.Factory;

public class ConnectionSQL implements NewConnection{


    private String host;
    private String port;
    private String user;
    private String password;

    public ConnectionSQL() {
        this.host = "localhost";
        this.port = "1433";
        this.user = "pablo";
        this.password = "1234";
    }


    @Override
    public void connect() {
        System.out.println("connected to SQLServer");

    }

    @Override
    public void disconnect() {
        System.out.println("disconnected to SQLServer");

    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
