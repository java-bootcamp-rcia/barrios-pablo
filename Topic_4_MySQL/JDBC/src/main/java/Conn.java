import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
public class Conn {

    public static void main(String[] args) {
        try{
            System.out.println("im trying to connect with MySQL");
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn= DriverManager.getConnection("jdbc:mysql://localhost/high_school?serverTimezone=UTC","root","1234");
            System.out.println("Successful connection");

            Statement state=conn.createStatement();

            ResultSet result1= state.executeQuery("select * from teachers where idteacher=2 ");
            while(result1.next()){
                System.out.println("Teacher: "+result1.getString("first_name")+" "+result1.getString("last_name"));
            }

            ResultSet result= state.executeQuery("select wd.day,st.start_hour,st.end_hour,cc.course_name from teachers as tt\n" +
                    "inner join courses as cc on tt.idteacher=cc.teacher_assigned\n" +
                    "inner join schedule_time as st on cc.schedule_time_idschedule_time=st.idschedule_time\n" +
                    "inner join week_days as wd on st.week_day=wd.idweek_days\n" +
                    "where tt.idteacher =2\n" +
                    "order by wd.idweek_days,st.start_hour\n" +
                    "");
            System.out.println("Schedule");


            while(result.next()){
                System.out.println(result.getString("day")+ "\t"+result.getString("start_hour")+"\t"+result.getString("end_hour")+"\t"+result.getString("course_name"));
            }


            }catch (SQLException e){
            System.out.println("Error MySQL"+e.getMessage());
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (Exception e){
            System.out.println("Next error founded: "+e.getMessage());
        }
    }
    }
