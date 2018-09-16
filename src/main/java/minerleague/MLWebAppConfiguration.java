package minerleague;

import com.meltmedia.dropwizard.mongo.MongoConfiguration;
import io.dropwizard.Configuration;
import com.fasterxml.jackson.annotation.JsonProperty;
import io.dropwizard.db.DataSourceFactory;
import org.hibernate.validator.constraints.*;

import javax.validation.Valid;
import javax.validation.constraints.*;

public class MLWebAppConfiguration extends Configuration {

    @JsonProperty("mongo")
    protected MongoConfiguration mongo;

    public MongoConfiguration getMongo() {
        return mongo;
    }
}
