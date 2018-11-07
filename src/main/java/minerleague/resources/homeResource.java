package minerleague.resources;

import minerleague.core.tweet;
import minerleague.views.*;

import io.dropwizard.views.freemarker.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.meltmedia.dropwizard.mongo.rxoplog.RxOplogService.logger;


@Path("/")
@Produces({MediaType.TEXT_HTML})
public class homeResource {

    public homeResource() {
        super();
    }

    public static Connection getRemoteConnection() {
        String jdbcUrl = "jdbc:mysql://minerleagueinstance.cb7jjwwv3aha.us-west-2.rds.amazonaws.com:3306/tweetDB?user=minerleague&password=minerleague1!";
        try {
            Connection con = DriverManager.getConnection(jdbcUrl);
            return con;
        } catch(SQLException e) {
            logger.warn(e.toString());
        }
        return null;
    }

    public List<tweet> getRecentTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets");

                while(results.next()) {
                    System.out.println("username: " + results.getString(4));
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    @GET
    @Path("home")
    public homeView fetchHomeView() {
        getRecentTweets();
        return new homeView();
    }

    @GET
    @Path("map")
    public mapView fetchMapView() {
        return new mapView();
    }
}
