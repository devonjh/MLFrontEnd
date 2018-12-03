package minerleague.core;

public class noLocationTweet {
    //tweet variables, correspond directly to processedTweets column values.
    private final String username;
    private final String tweetText;
    private final float sickProbability;
    private final float fpProbability;

    //Constructor
    public noLocationTweet(String tweetText, String username, float sickProbability, float fpProbability) {
        this.username = username;
        this.tweetText = tweetText;
        this.sickProbability = sickProbability;
        this.fpProbability = fpProbability;
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
}
