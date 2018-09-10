package minerleague;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.dropwizard.views.ViewBundle;
import io.dropwizard.assets.AssetsBundle;

import minerleague.resources.homeResource;

public class MLWebAppApplication extends Application<MLWebAppConfiguration> {

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
        bootstrap.addBundle(new ViewBundle());
        bootstrap.addBundle(new AssetsBundle());
    }

    //The main() entry method. Register all resources necessary.
    @Override
    public void run(final MLWebAppConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new homeResource());
    }
}
