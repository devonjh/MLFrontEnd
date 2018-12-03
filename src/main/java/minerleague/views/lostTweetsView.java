package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.noLocationTweet;

import java.util.List;

public class lostTweetsView extends View {

    private final List<noLocationTweet> tweetList;
    private final int fp, sickTweets;

    public lostTweetsView(List<noLocationTweet> tweets, int fp, int sickTweets) {
        super("lostTweets.ftl");
        this.tweetList = tweets;
        this.fp = fp;
        this.sickTweets = sickTweets;
    }

    public List<noLocationTweet> getTweetList() {
        return tweetList;
    }
    public int getFp() { return this.fp; }
    public int getSickTweets() { return this.sickTweets; }
}