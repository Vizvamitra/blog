class RecalculateTagsJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    TagAggregator.run
  end
  
end
