package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.tweet;

import java.util.List;

public class threeWeekView extends View {
    private final List<tweet> tweetList;
    private final int fp, sickTweets;

    public threeWeekView(List<tweet> tweets, int fp, int sickTweets) {
        super("threeWeek.ftl");
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
