![tea](./app/media/images/content-pixie-m-gqDRzbJLQ-unsplash.jpeg)

# Tea Service

![ruby](https://img.shields.io/badge/Ruby-2.7.4-red)
![rails](https://img.shields.io/badge/Rails-5.2.8-g)

# Schema

![schema](./app/media/images/Screen%20Shot%202022-08-04%20at%2011.01.01.png)

# Endpoints

- <b>GET</b> Customer Show Page
````ruby
/api/v1/customers/:customer_id
````
````json
{
      "data": {
        "type": "customers",
        "id": "customer.id",
        "attributes": {
          "first_name": "customer.first_name",
          "last_name": "customer.last_name",
          "email": "customer.email",
          "address": "customer.address"
        },
        "subscriptions": {
          "active":
            "customers_subscriptions.title",
          "canceled":
            "customers_subscriptions.title"
        }
      }
    }
````
- <b>POST</b> New Subscription
- cs = customers_subscription
````ruby
/api/v1/customers/:cusomter_id/subscriptions/:subscription_id/new
````
````json

{
      "message": "Successfully subscribed!",
      "data": {
        "customer_id": "cs.customer_id",
        "subscription_id": "cs.subscription_id",
        "status": "cs.status"
      }
    }
````

- <b>PATCH</b> Cancel a subscription
- cs = customer_subscription
````ruby
/api/v1/customers/:cusomter_id/subscriptions/:subscription_id/edit
````
````json
{
    "message": "Successfully unsubscribed!",
    "data": {
      "customer_id": "cs.customer_id",
      "subscription_id": "cs.subscription_id",
      "status": "cs.status"
    }
  }
````
