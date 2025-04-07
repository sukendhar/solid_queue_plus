module SolidQueuePlus
  class RetryMiddleware
    MAX_RETRIES = 5

    def call(job)
      yield
    rescue => e
      attempts = job.metadata["retries"].to_i
      if attempts < MAX_RETRIES
        delay = 2**attempts
        job.metadata["retries"] = attempts + 1
        job.enqueue(wait: delay.seconds)
      else
        Notifier.notify_failure(job, e)
        raise e
      end
    end
  end
end
