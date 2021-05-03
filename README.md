
# Trade Route Sample Server

## Threat Model
[Link to Threat Model](https://tinyurl.com/w8eu7kcy)

## Trade Route General Information

<p> Trade Route is a desktop Java application with JavaFX front-end and, hopefully soon, a Spring Boot backend.
Trade Route is an application for small-time food producers which do not have large sales teams. It
was created to give them an application which provides most of the functionality that a sales team would,
like planning, projecting and strategizing on different routes to bring a product to market. The application
makes use of roles because the company manager or owner is able to see the precise monetary
calculation while regular employees will tyically see comparative indexes, allowing them to still read and write
data but in a different format. Due to this, in the future I plan to add Okta OAuth Open Id to the application.
Unfortunately I was unable to add the implementation here to the original traderoute code base
because when trying to integrate spring boot and changing my java
version to fit the spring java version, I ran into a git problem which told me 
all my files had been deleted. Therefore I decided to extract this
into its own practice mini project, which will make it much easier for me 
to integrate into the traderoute project later on. </p>



## Setup Information

<p>
Running the application works after removing/commenting out lines 20,
21 and 29 in SecurityConfiguration.java and doing the same for the first
six lines of application.properties. 
Then, uncommenting lines 23, 24 and 31-38 in the SecurityConfiguration.java will
make the program run an H2 database instead of the unreachable mysql schema instance 
which is its usual source. 
</p>

<p>Try navigating to the localhost:8080/user or localhost:8080/admin endpoitns
  with credentials user:pass and admin:pass to discover the main features that have been implemented.
</p>

## Security Related Features
<ol>
<li><p>
This Trade Route sample server leverages the capabilities of
spring and adds a few extra features on it like forced https requests and authorizes users
through roles which are assigned to them in the in-memory database. In the future this is how I will
be able to distinguish what resource can be accessed by regular employees
that use the Trade Route service vs. the managers who will have full access to
all the financial details of their company through the Trade Route app. 
Failed requests are returned with error codes 401/403 which happen when 
a user is not authenticated, meaning their username and password dont fit
or when they are not authorized, like when a regular user tries to access
/admin endpoint. 
</p></li>

<li><p>
Spring Security uses a Servlet Filterchain to process Http requests. Before 
any request comes in, it goes in a specific order 15 filters before arriving at the 
@RestControllers. An example of one of these filters is the DefaultLoginPageGeneratingFilter
which is created as soon as the spring security dependency is added to maven. This filter
ensures that as soon as a a request is made, a default login screen is added on the restricted 
endpoints which are configured in the configure(http) method in the SecurityConfiguration.java
class.
<p></li>

<li><p>
Http requests are redirected to https , by generating a pair of cryptographic keys
to create an SSL certificate which is stored at keystore.jks in the resources
folder. The configure(HttpSecurity http) method ensures that everyone can 
access the blank default landing page but that admins are allowed to access admin and 
user content, while users are only allowed to access user content.
<\p></li>

<li><p>
The configure(web) method in SecurityConfiguration.java class ensures that all requests to the
resources folder are ignored so if in the future functionality is added to access resources
from that folder, then application users still won't be able to access it.
<\p></li>

<li><p>
Another security feature which is not used when the steps in the above `Setup Information`
section is followed, is protection from SQL injection attacks. The user details service
uses the loadByUserName() method in MyUserDetailsService uses the method findByUserName()
which is essentially like a parametrized query that spring JPA provides. 
<\p></li>

</ol>

## Remarks
<p>
I've also created a [separate repo](https://github.com/AlAlber/TRServerDemo2) for my attempts at implementing an OAuth2.0
OIDC authorization flow with the provider Okta where I unfortunately couldn't get the 
server to run because it cannot recognize the okta.oauth2.issuer in the application.properties
and I wasn't able to fix this in time. [This is the link](https://github.com/AlAlber/traderoute1) 
to the original trade route application repo.
</p>
