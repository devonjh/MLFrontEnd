package minerleague.views;

import io.dropwizard.views.View;
import io.dropwizard.views.freemarker.*;

public class homeView extends View{

    public homeView() {
        super("choropleth.ftl");
    }
}
