#What all these commands do?
* This is a tool for configuring unicorn and nginx
* It does run unicorn

##*app_config* 
### It configures your local nginx server to run diffent unicorn instances.

``~/my_app $`` *app_config new 2121*

	1.	Configures unicorn mapping apps port config file

		other_app: 2020
		my_app: 2121


	2.	Add a new entry to your /etc/hosts file

		127.0.0.1 my_app.dev

	3. configures nginx virtual host under my_app.dev that proxies requests to port 2121

``~/my_app $`` *app_config show*

**Configured apps:**

|Application name   | Port|
|:------------------|:----|
| other_app         | 2020| 
| my_app            | 2121|


##*unicorn_loader* 
### It runs your app under unicorn using the specified port

``~/my_app $`` *unicorn_loader*