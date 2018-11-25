package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.tweet;

import java.util.List;

public class oneWeekView extends View {
    private final List<tweet> tweetList;

    public oneWeekView(List<tweet> tweets) {
        super("oneWeek.ftl");
        this.tweetList = tweets;
    }

    public List<tweet> getTweetList() {
        return tweetList;
    }
}
