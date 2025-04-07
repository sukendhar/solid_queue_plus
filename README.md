# SolidQueue Plus

SolidQueue Plus is a Ruby gem that extends the functionality of Rails 8's Solid Queue system with:

- ✅ Retry middleware with exponential backoff
- 📣 Slack or Email failure notifications
- 📊 Lightweight Rails engine dashboard for job monitoring

---

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'solid_queue_plus', github: 'sukendhar/solid_queue_plus'
```

Then run:

```bash
bundle install
```

---

## Usage

### 🔁 Automatic Job Retries

Add this to an initializer:

```ruby
SolidQueue.before_perform do |job|
  SolidQueuePlus::RetryMiddleware.new.call(job) do
    job.perform_now
  end
end
```

Customize retry logic in `RetryMiddleware`.

---

### 🛑 Failure Notifications

Set your Slack webhook URL:

```bash
export SOLID_QUEUE_SLACK_WEBHOOK=https://hooks.slack.com/services/your/webhook/url
```

Edit `SolidQueuePlus::Notifier` to integrate with:
- Slack (`slack-notifier`)
- Email (via ActionMailer, optional)

---

### 📊 Monitoring Dashboard

Mount the dashboard in `config/routes.rb`:

```ruby
mount SolidQueuePlus::Engine => "/solid_queue_plus"
```

Then open [http://localhost:3000/solid_queue_plus](http://localhost:3000/solid_queue_plus) to view live job status.

---

## Roadmap

- [ ] Add Hotwire interactivity to dashboard
- [ ] Add filters and retry actions to dashboard UI
- [ ] Built-in authentication support

---

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/sukendhar/solid_queue_plus](https://github.com/yourusername/solid_queue_plus).

---

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
