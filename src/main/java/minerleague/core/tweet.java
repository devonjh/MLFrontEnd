package minerleague.core;

public class tweet {

    //tweet variables, correspond directly to processedTweets column values.
    private final String username;
    private final String tweetText;
    private final float sickProbability;
    private final float fpProbability;
    private final float latitude;
    private final float longitude;

    //Constructor
    public tweet(String tweetText, String username, float sickProbability, float fpProbability, float latitude, float longitude) {
        this.username = username;
        this.tweetText = tweetText;
        this.sickProbability = sickProbability;
        this.fpProbability = fpProbability;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    //Getters
    public String getUsername() {
        return this.username;
    }
    public String getTweetText() {
        return this.tweetText;
    }
    public float getSickProbability() {return this.sickProbability;}
    public float getFpProbability() {return this.fpProbability;}
    public float getLongitude() {
        return this.longitude;
    }
    public float getLatitude() {
        return this.latitude;
    }

}
