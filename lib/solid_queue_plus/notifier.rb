module SolidQueuePlus
  class Notifier
    def self.notify_failure(job, error)
      Rails.logger.error("[SolidQueuePlus] Job #{job.id} failed: #{error.message}")
    end
  end
end
