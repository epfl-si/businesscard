# Development Environment

To be done once:
1. Unless you like fiddling with your adress bar all the time, apply the “Tequila Bugware” § below

To be done every time:
- Be in EPNET (VPN or on-site at EPFL)
- To start things, say <pre>make up</pre>
- To stop things, say <pre>make down<pre>
- To start over (including destroying and recreating the database content), say <pre>make rinse</pre>

💡 You can also combine multiple `make` commands, e.g. <pre>make rinse up</pre>

## Tequila Bugware

Install the Redirector browser extension and configure it thusly:
   - Description: Tequila bugware, Businesscard edition
   - Example URL: https://localhost/cgi-bin/businesscard?auth_check=sdpofksdpfksdpfo
   - Include pattern: https://localhost/cgi-bin/businesscard\?auth_check=(.*)
   - Redirect to: http://localhost:8080/cgi-bin/businesscard?auth_check=$1
   - Pattern type: Regular Expression
   - Pattern description: Tequila refuses to 302 us back to the correct protocol and port, so we do it ourselves.
