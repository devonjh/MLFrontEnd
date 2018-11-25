package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.tweet;

import java.util.List;

public class twoWeekView extends View {
    private final List<tweet> tweetList;

    public twoWeekView(List<tweet> tweets) {
        super("twoWeek.ftl");
        this.tweetList = tweets;
    }

    public List<tweet> getTweetList() {
        return tweetList;
    }
}
