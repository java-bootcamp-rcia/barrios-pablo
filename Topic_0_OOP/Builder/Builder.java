package Topic_0.DesignPattern;

public class Builder {
    public static class MySQLConnection {
        String host;
        String port;
        String user;
        String password;


        public MySQLConnection host(String host) {
            this.host = host;
            return this;
        }

        public MySQLConnection port(String port) {
            this.port = port;
            return this;
        }

        public MySQLConnection user(String user) {
            this.user = user;
            return this;
        }

        public MySQLConnection password(String password) {
            this.password = password;
            return this;
        }

        public Builder build() {
            Builder conn = new Builder();
            conn.host = this.host;
            conn.port = this.port;
            conn.user = this.user;
            conn.password = this.password;
            return conn;


        }

    }
        private String host;
        private  String port;
        private  String user;
        private  String password;

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



        private Builder(){
        //Constructor
        }
    }







