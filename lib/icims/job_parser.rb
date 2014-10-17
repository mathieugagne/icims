module ICIMS
  class JobParser

    COMPANIES = {
      6 => 'Chicago',
      7 => 'New York',
      8 => 'Montreal',
      9 => 'London',
      10 => 'Singapore',
    }

    def initialize job_offer
      @job_offer = job_offer
    end

    def title
      @job_offer.jobtitle
    end

    def category
      @job_offer.positioncategory.fetch('formattedvalue') if @job_offer.positioncategory.present?
    end

    def locations
      company_ids = []
      company_ids << @job_offer.joblocation.fetch('companyid')
      if @job_offer.additionallocations.present?
        @job_offer.additionallocations.each do |location|
          company_ids << location['location'].fetch('companyid') if location and location['location']
        end
      end
      company_ids.map{|id| fetch_company(id)}.compact.uniq
    end

    def approved
      @job_offer.folder.present? and @job_offer.folder.fetch('value') == 'Approved'
    end

    def hire_type
      @job_offer.positiontype.fetch('formattedvalue') if @job_offer.positiontype.present?
    end

    def description
      @job_offer.overview
    end

    private

    def fetch_company id
      COMPANIES.fetch(id.to_i, nil) if id
    end

  end
end