package Topic_0.Singleton;

import java.sql.Connection;

public class PatternDesign {

    public static void main(String[] args){
        Connection connection=Singleton.getConnection();

    }
}
