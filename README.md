# Businesscard

This is the source code behind businesscard.epfl.ch, a website that allows
autorized persons to order business cards at EPFL.

This website propose a small workflow to track the orders until the printing and
delivrery process (and eventually invoicing).

# Development Environment

To be done once: unless you like fiddling with your adress bar all the time,
apply the “Tequila Bugware” § below.

The base image is [common-web](https://github.com/epfl-si/common-web), you will
need to `docker login ghcr.io` to access the image. Please follow instructions 
from the [common-web](https://github.com/epfl-si/common-web) repo.

To be done every time:
   - Be in EPNET (VPN or on-site at EPFL)
   - To start things, say `make up`
   - To stop things, say `make down`
   - To start over (including destroying and recreating the database content), 
     say `make rinse`

💡 You can also combine multiple `make` commands, e.g. `make rinse up`.


## Tequila Bugware

Install the Redirector browser extension and configure it thusly:
   - Description: Tequila bugware, Businesscard edition
   - Example URL: https://localhost/cgi-bin/businesscard?auth_check=sdpofksdpfksdpfo
   - Include pattern: https://localhost/cgi-bin/businesscard\?auth_check=(.*)
   - Redirect to: http://localhost:8080/cgi-bin/businesscard?auth_check=$1
   - Pattern type: Regular Expression
   - Pattern description: Tequila refuses to 302 us back to the correct protocol and port, so we do it ourselves.
