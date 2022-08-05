# Tea Service

![ruby](https://img.shields.io/badge/Ruby-2.7.4-red)
![rails](https://img.shields.io/badge/Rails-5.2.8-g)

# Endpoints

- <b>GET</b> Customer Show Page
````json
/api/v1/cusomter/:customer_id

{
      "data": {
        "type": "customers",
        "id": customer.id,
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address
        },
        "subscriptions": {
          "active":
            customer.customers_subscriptions
            .joins(:subscription)
            .where(customers_subscriptions: { status: 0})
            .pluck('title'),
          "canceled":
            customer.customers_subscriptions
            .joins(:subscription)
            .where(customers_subscriptions: { status: 1})
            .pluck('title')
        }
      }
    }
````
- <b>POST</b> New Subscription
- cs = customers_subscription
````json
/api/v1/customers/:cusomter_id/subscriptions/:subscription_id/new

{
      "message": "Successfully subscribed!",
      "data": {
        "customer_id": cs.customer_id,
        "subscription_id": cs.subscription_id,
        "status": cs.status
      }
    }
````

- <b>PATCH</b> Cancel a subscription
- cs = customer_subscription
````json
{
    "message": "Successfully unsubscribed!",
    "data": {
      "customer_id": cs.customer_id,
      "subscription_id": cs.subscription_id,
      "status": cs.status
    }
  }
````