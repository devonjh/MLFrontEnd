package minerleague.views;

import io.dropwizard.views.View;
import io.dropwizard.views.freemarker.*;
import minerleague.core.tweet;

import java.util.List;

public class homeView extends View{
    private final List<tweet> tweetList;
    private final int fp, sickTweets;

    public homeView(List<tweet> tweets, int fp, int sickTweets) {
        super("homePage.ftl");
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
