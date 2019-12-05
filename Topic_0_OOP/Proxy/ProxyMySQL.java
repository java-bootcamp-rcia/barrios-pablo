package Topic_0.ProxyDesign;

public class ProxyMySQL implements IConnection  {

        private String host;
        private String port;
        private String user;
        private String password;

        public ProxyMySQL() {
            this.host = "localhost";
            this.port = "3306";
            this.user = "root";
            this.password = "1234";
        }


        @Override
        public void connect() {
            System.out.println("connected to MySQL");

        }

        @Override
        public void disconnect() {
            System.out.println("disconnected to MySQL");

        }

        @Override
        public String toString() {
            return "ConnectionMySQL [host=" + host + ", port=" + port + ", user=" + user + ", password="
                    + password + "]";
        }
    }

