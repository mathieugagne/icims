module ICIMS

  require 'ostruct'

  class Job < OpenStruct

    class << self

      DEFAULT_FIELDS = %w(id folder jobtitle positioncategory positiontype joblocation additionallocations overview)

      def find job_id, fields: []
        url = "/jobs/#{job_id}"
        fields = DEFAULT_FIELDS unless fields.any?
        url << "?fields=#{fields.join(',')}"
        attributes = ICIMS::GetRequest.perform(url)
        new(attributes)
      end

      def search filters
        fetch(filters)
      end

      def approved
        fetch([
          {
            name: "job.folder",
            value: ['C14567'],
            operator: "="
          },
          {
            name: "job.postedto",
            value: ['3'],
            operator: "="
          }
        ])
      end

      private

      def fetch filters
        ids = fetch_ids(filters)
        fetch_records(ids)
      end

      def fetch_ids filters
        params = {filters: filters}
        response = ICIMS::SearchRequest.perform(:jobs, params)
        return [] unless response['searchResults'].present?
        response['searchResults'].map{|job_hash| job_hash['id']}
      end

      def fetch_records ids
        ids.map{|id| find(id)}
      end

    end

  end
end