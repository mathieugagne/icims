module ICIMS
  class Sync

    def call
      JobOffer.update_all(approved: false)
      icims_records.each do |icims_record|
        job_offer = JobOffer.where(icims_id: icims_record.id).first_or_initialize
        parsed_icims_record = JobOfferParser.new(icims_record)
        %w(title category locations hire_type description approved).each do |attribute|
          job_offer.send("#{attribute}=", parsed_icims_record.send(attribute))
        end
        job_offer.save! if job_offer.valid?
      end
    end

    private

    def icims_records
      ICIMS::Job.approved
    end

  end
end