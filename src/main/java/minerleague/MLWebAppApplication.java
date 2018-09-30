package minerleague;

import com.meltmedia.dropwizard.mongo.MongoBundle;
import com.mongodb.DB;
import com.mongodb.MongoClient;
import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;
import io.dropwizard.assets.AssetsBundle;

import minerleague.resources.homeResource;
import minerleague.resources.mapResource;

public class MLWebAppApplication extends Application<MLWebAppConfiguration> {

    //MongoBundle<MLWebAppConfiguration> mongoBundle;

    public static void main(final String[] args) throws Exception {
        new MLWebAppApplication().run(args);
    }

    @Override
    public String getName() {
        return "MLWebApp";
    }

    //Initialize all necessary bundles.
    @Override
    public void initialize(final Bootstrap<MLWebAppConfiguration> bootstrap) {

        //Add the view bundle to render the freemarker templates.
        bootstrap.addBundle(new ViewBundle());

        //Add the assets bundle so the freemarker templates can access the css and such.
        bootstrap.addBundle(new AssetsBundle());

        /*
        //Add the mongoBundle to hopefully access the mongo database.
        bootstrap.addBundle(mongoBundle = MongoBundle.<MLWebAppConfiguration>builder()
                .withConfiguration(MLWebAppConfiguration::getMongo)
                .build());*/
    }

    //The main() entry method. Register all resources necessary.
    @Override
    public void run(final MLWebAppConfiguration configuration,
                    final Environment environment) {
        //MongoClient mongo = new MongoClient("69.166.49.230", 27017);
        //mongo.getDatabase("admin").createCollection("testCollection");
        environment.jersey().register(new homeResource());
        environment.jersey().register(new mapResource());
    }
}
