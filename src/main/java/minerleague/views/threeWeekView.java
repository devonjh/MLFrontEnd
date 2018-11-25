package minerleague.views;

import io.dropwizard.views.View;
import minerleague.core.tweet;

import java.util.List;

public class threeWeekView extends View {
    private final List<tweet> tweetList;

    public threeWeekView(List<tweet> tweets) {
        super("threeWeek.ftl");
        this.tweetList = tweets;
    }

    public List<tweet> getTweetList() {
        return tweetList;
    }
}
