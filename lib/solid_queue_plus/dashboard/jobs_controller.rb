module SolidQueuePlus
  module Dashboard
    class JobsController < ApplicationController
      def index
        @queued_jobs = SolidQueue::Job.queued
        @failed_jobs = SolidQueue::Job.failed
        @scheduled_jobs = SolidQueue::Job.scheduled
      end
    end
  end
end
