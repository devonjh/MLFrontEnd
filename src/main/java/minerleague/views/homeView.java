package minerleague.views;

import io.dropwizard.views.View;
import io.dropwizard.views.freemarker.*;
import minerleague.core.tweet;

import java.util.List;

public class homeView extends View{
    private final List<tweet> tweetList;

    public homeView(List<tweet> tweets) {
        super("homePage.ftl");
        this.tweetList = tweets;
    }

    public List<tweet> getTweetList() {
        return tweetList;
    }
}
