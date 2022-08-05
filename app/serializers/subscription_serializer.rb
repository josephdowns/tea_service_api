class SubscriptionSerializer
  def self.index(subs)
    subs.each do |sub|
      {
        "data": {
          "type": "subscriptions",
          "id": sub.id,
          "attributes": {
            "title": sub.title,
            "price": sub.price,
            "frequency": sub.frequency
          }
        }
      }
    end
  end
end