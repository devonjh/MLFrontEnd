package minerleague.resources;

import minerleague.views.homeView;

import io.dropwizard.views.freemarker.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Path("/")
@Produces({MediaType.TEXT_HTML})
public class homeResource {

    public homeResource() {
        super();
    }

    @GET
    @Path("home")
    public homeView fetchHomeView() {
        return new homeView();
    }
}
