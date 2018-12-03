package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.tweet;

import java.util.List;

public class allTimeView extends View {
    private final List<tweet> tweetList;
    private final int fp, sickTweets;

    public allTimeView(List<tweet> tweets, int fp, int sickTweets) {
        super("allTime.ftl");
        this.tweetList = tweets;
        this.fp = fp;
        this.sickTweets = sickTweets;
    }

    public List<tweet> getTweetList() {
        return tweetList;
    }
    public int getFp() { return this.fp; }
    public int getSickTweets() { return this.sickTweets; }
}
