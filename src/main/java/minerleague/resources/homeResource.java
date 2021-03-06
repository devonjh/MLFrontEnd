package minerleague.resources;

import minerleague.core.tweet;
import minerleague.core.noLocationTweet;
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

    /* SQL RELATED METHODS, INCLUDES THE CONNECTION STRING METHOD, AS WELL AS THE ONE/TWO/THREE/AND ALL TWEETS QUERIES*/

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

    public List<tweet> getAllTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public List<tweet> getCurrentDayTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets WHERE DATE(dateAdded) = DATE(NOW());");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public List<tweet> getOneWeekTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL 7 DAY");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public List<tweet> getTwoWeekTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL 14 DAY");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public List<tweet> getThreeWeekTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL 21 DAY");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public List<tweet> getFourWeekTweets() {
        List<tweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL 28 DAY");
                while(results.next()) {
                    tweet newTweet = new tweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4), results.getFloat(5), results.getFloat(6));
                    tweetList.add(newTweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public int falsePositives(int days) {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT SUM(nonSickTweetsProcessed) FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL " + Integer.toString(days) + " DAY");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int allFalsePositivesCount() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT SUM(nonSickTweetsProcessed) FROM processedTweets");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int falsePositivesCurrentDay() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT SUM(nonSickTweetsProcessed) FROM processedTweets WHERE DATE(dateAdded) = DATE(NOW())");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int getSickCountCurrentDay() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT COUNT(*) FROM processedTweets WHERE DATE(dateAdded) = DATE(NOW())");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int getSickCount(int days) {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT COUNT(*) FROM processedTweets WHERE dateAdded >= DATE(NOW()) - INTERVAL " + Integer.toString(days) + " DAY");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int getAllSickCount() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT COUNT(*) FROM processedTweets");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public List<noLocationTweet> getLostTweets() {
        List<noLocationTweet> tweetList = new ArrayList<>();

        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT * FROM noLocationTweets");
                while(results.next()) {
                    noLocationTweet tweet = new noLocationTweet(results.getString(1), results.getString(2), results.getFloat(3), results.getFloat(4));
                    tweetList.add(tweet);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return tweetList;
    }

    public int getNoLocationFP() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT SUM(nonSickTweetsProcessed) FROM noLocationTweets");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    public int getNoLocationSickTweetCount() {
        Connection con = getRemoteConnection();

        //if connection was made, execute query and store values.
        if (con != null) {
            try {
                Statement queryStatement = con.createStatement();
                ResultSet results = queryStatement.executeQuery("SELECT COUNT(*) FROM noLocationTweets");
                while(results.next()) {
                    return results.getInt(1);
                }
            }catch(SQLException e) {System.out.println(e.toString());}

        }
        return 0;
    }

    /* Methods for the multiple views, and URL's within the web application. */
    @GET
    @Path("home")
    public homeView fetchHomeView() {
        List<tweet> allTweets = getCurrentDayTweets();
        int fp = falsePositivesCurrentDay();
        int sickTweets = getSickCountCurrentDay();
        return new homeView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("oneWeek")
    public oneWeekView fetchOneWeekView() {
        List<tweet> allTweets = getOneWeekTweets();
        int fp = falsePositives(7);
        int sickTweets = getSickCount(7);
        return new oneWeekView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("twoWeeks")
    public twoWeekView fetchTwoWeekView() {
        List<tweet> allTweets = getTwoWeekTweets();
        int fp = falsePositives(14);
        int sickTweets = getSickCount(14);
        return new twoWeekView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("threeWeeks")
    public threeWeekView fetchThreeWeekView() {
        List<tweet> allTweets = getThreeWeekTweets();
        int fp = falsePositives(21);
        int sickTweets = getSickCount(21);
        return new threeWeekView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("fourWeeks")
    public fourWeekView fetchFourWeekView() {
        List<tweet> allTweets = getFourWeekTweets();
        int fp = falsePositives(28);
        int sickTweets = getSickCount(28);
        return new fourWeekView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("lostTweets")
    public lostTweetsView fetchLostTweetsView() {
        List<noLocationTweet> allTweets = getLostTweets();
        int fp = getNoLocationFP();
        int sickTweets = getNoLocationSickTweetCount();
        return new lostTweetsView(allTweets, fp, sickTweets);
    }

    @GET
    @Path("allTime")
    public allTimeView fetchAllTimeView() {
        List<tweet> allTweets = getAllTweets();
        int fp = allFalsePositivesCount();
        int sickTweets = getAllSickCount();
        return new allTimeView(allTweets, fp, sickTweets);
    }
}
