package minerleague.views;

import io.dropwizard.views.View;
import io.dropwizard.views.freemarker.*;

public class mapView extends View{
    public mapView() {
        super("heatMap.ftl");
    }
}
