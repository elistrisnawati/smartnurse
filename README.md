<<<<<<< HEAD
# Smart Nurse
=======
# smartnurse
>>>>>>> 9dae0bf (update readme)

Smart Nurse Application to improve the Nursery Operation by Digitalization

UI is developed by @FadilaCendikia 
<<<<<<< HEAD

BackEnd is developed by @elistrisnawati

To access to back-end:

1. User Name: `u01`
2. Password: `***`
3. Secret: `1fejZk40***`
4. Client: `pie`
3. URL Business: https://app.n-tco.com
4. URL Auth: "https://sso.n-tco.com/auth/realms/YSH/protocol/openid-connect/token

You can use PostMan for your convenience.

How to run:

1. Get the Token by passing using OAUTH2 to URL Auth
2. Using the generated token get the secret key and session key
3. Using the secret key & session key to query to the system.

### Secret Key

1. NURSE: `YYEkld6y***`

###Example
####To Sign In to OAUTH2
````
curl 'https://sso.n-tco.com/auth/realms/YSH/protocol/openid-connect/token' 
  -X POST
  -H 'Accept: application/json, text/javascript, */*; q=0.01' 
  -H 'Accept-Encoding: gzip, deflate, br' 
  -H 'Content-Type: application/x-www-form-urlencoded' 
  --data-raw 'client_id=CLIENT&client_secret=SECRET&username=USER&password=PASSWORD&grant_type=password'
````
####To Authenticate & getting the Secret Key and Session Key
````
curl 'https://app.pie.co.id/rest/page/authenticate' 
  -X POST 
  -H 'Accept: application/json, text/javascript, */*; q=0.01' 
  -H 'Content-Type: application/json;charset=utf-8' 
  -H 'Authorization: Bearer TOKEN' 
  --data-raw '{"clientId":"SNE"}'
````
####To Load Nurse
````
curl 'https://app.pie.co.id/rest/composite/query' 
  -X POST 
  -H 'Accept: application/json, text/javascript, */*; q=0.01' 
  -H 'Accept-Encoding: gzip, deflate, br' 
  -H 'Content-Type: application/json;charset=utf-8' 
  -H 'Authorization: Bearer TOKEN' 
  -H 'x-session: SESSION' 
  --data-raw '{"secretKey":"SECRET","filterMap":{"ACTIVE":true}}'
````
=======
BackEnd is developed by @elistrisnawati

>>>>>>> 9dae0bf (update readme)
