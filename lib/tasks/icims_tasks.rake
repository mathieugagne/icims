namespace :icims do
  task index: :environment do
    JobOffer.__elasticsearch__.delete_index!
    JobOffer.__elasticsearch__.create_index!
    JobOffer.import
  end
  task sync: :environment do
    ICIMS::Sync.new.call
  end
end