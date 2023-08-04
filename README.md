# Tea Subscription API
## README
## About
This is a RESTful API server application to allow customers to subscribe, create, cancel, and view all their tea subscriptions.
## Built with:
- Ruby - V3.1.1
- Rails - V7.0.6
## Endpoints

### Subscribe a customer to a tea subscription
```
#request
post {{domain}}/api/v0/customer_subscription

#response
{
  "data": {
      "message": "Customer has been successfully subscribed."
  }
}
```
### Cancel a subscription
```
#request
patch {{domain}}/api/v0/customer_subscriptions

#response
{
  "data": {
      "message": "Customer subscription has been cancelled."
  }
}
```
### View all subscriptions for a specific customer
```
#request
get {{domain}}/api/v0/customers/:customer_id/subscriptions

#response
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
          "title": "Energey",
          "price": 30.72,
          "frequency": "5"
      }
    },
    {
      "id": "2",
      "type": "subscription",
      "attributes": {
          "title": "Breakfast",
          "price": 25.03,
          "frequency": "3"
      }
    },
    ...
  ]
}
```
### View all Subscriptions
```
#request
get {{domain}}/api/v0/subscriptions

#response
{
  "data": [
    {
      "id": "1",
      "type": "subscription",
      "attributes": {
          "title": "Energey",
          "price": 30.72,
          "frequency": "5"
      }
    },
    {
      "id": "2",
      "type": "subscription",
      "attributes": {
          "title": "Breakfast",
          "price": 25.03,
          "frequency": "3"
      }
    },
    {
      "id": "3",
      "type": "subscription",
      "attributes": {
          "title": "Sleepy Teas",
          "price": 34.61,
          "frequency": "6"
      }
    },
    ...
  ]
}
```
### View one Subscription
```
#request
get {{domain}}/api/v0/subscriptions/:subscription_id

#response
{
  "data": {
    {
      "id": "2",
      "type": "subscription",
      "attributes": {
          "title": "Breakfast",
          "price": 25.03,
          "frequency": "3"
      }
    }
  }
}
```
## Get a local copy of this repository
1. Clone this repository
```
git@github.com:AlecKap/tea_subscription_api.git
```
2. Navigate into cloned repository run the following commands in your terminal
  - Create database
    ```rails db:{create,migrate,seed}```
  - Install dependencies
    ```bundle install```
3. Run test suite to make sure everything was setup correctly
  - ```bundle exec rspec```
  - All tests should be passing
4. Start up local server to test endpoints, in your terminal run ```rails s```
  - Running the create database command also seeds the development database with fake information
  - In Postman (or whichever API platform you use to test requests/responses), try the endpoints designed above


## Created By:
- Alec Kapicak |[Github](https://github.com/AlecKap)| |[LinkedIn](https://www.linkedin.com/in/alec-kapicak/)|


