package minerleague.core;

public class tweet {

    //tweet variables, correspond directly to processedTweets column values.
    private final String username;
    private final String tweetText;
    private final float probability;
    private final float latitude;
    private final float longitude;

    //Constructor
    private tweet(String username, String tweetText, float probability, float latitude, float longitude) {
        this.username = username;
        this.tweetText = tweetText;
        this.probability = probability;
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

    public float getProbability() {
        return this.probability;
    }

    public float getLongitude() {
        return this.longitude;
    }

    public float getLatitude() {
        return this.latitude;
    }

}
