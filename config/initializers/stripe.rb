if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_xjkB3HyqvSQgdI284DmUBEKh',
    secret_key: 'sk_test_UCYGoLDZbUl5Q4EeqlHcKOwd'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
