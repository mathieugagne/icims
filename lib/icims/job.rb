module ICIMS

  require 'ostruct'

  class Job < OpenStruct

    class << self

      DEFAULT_FIELDS = %w(id folder jobtitle positioncategory positiontype joblocation additionallocations overview responsibilities)

      def find job_id, fields: []
        fields = DEFAULT_FIELDS unless fields.any?
        if job_id.is_a?(Array)
          fetch_records(job_id, fields)
        else
          fetch_single(job_id, fields)
        end
      end

      def search filters, fields: []
        fields = DEFAULT_FIELDS unless fields.any?
        ids = fetch_ids(filters)
        fetch_records(ids, fields)
      end

      def approved portal_ids=[]
        portal_ids = ICIMS.portal_ids unless portal_ids.any?
        portal_ids.map do |id|
          search([
            { name: "job.folder",   value: ['D31001'], operator: "=" },
            { name: "job.postedto", value: [id],       operator: "=" }
          ])
        end.flatten
      end

      private

      def fetch_ids filters
        params = {filters: filters}
        response = ICIMS::SearchRequest.perform(:jobs, params)
        return [] unless response['searchResults'].present?
        response['searchResults'].map{|job_hash| job_hash['id']}
      end

      def fetch_records ids, fields
        ids.map{|id| fetch_single(id, fields)}
      end

      def fetch_single id, fields
        url = "/jobs/#{id}"
        url << "?fields=#{fields.join(',')}"
        attributes = ICIMS::GetRequest.perform(url)
        new(attributes)
      end

    end

  end
end