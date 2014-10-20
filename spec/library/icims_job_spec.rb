require 'spec_helper'

describe ICIMS::Job do

  let(:get_response)  {"{\"folder\":{\"id\":\"D31001\",\"value\":\"Approved\",\"formattedvalue\":\"Approved\"},\"jobtitle\":\"Senior Software Engineer - Infrastructure Software Services\",\"joblocation\":{\"id\":5,\"companyid\":6,\"address\":\"https://api.icims.com/customers/4560/companies/6/fields/addresses/5\",\"value\":\"Chicago - 540 W. Madison Street Suite 2500 Chicago, Illinois 60661 United States \"},\"links\":[{\"title\":\"The current profile being viewed.\",\"rel\":\"self\",\"url\":\"https://api.icims.com/customers/4560/jobs/1026\"}],\"hiringmanager\":{\"id\":564,\"value\":\"Philip Chennikkara\",\"profile\":\"https://api.icims.com/customers/4560/people/564\"},\"recruiter\":{\"id\":95,\"value\":\"Gabe Velazquez\",\"profile\":\"https://api.icims.com/customers/4560/people/95\"},\"jobid\":\"2014-1026\"}"}

  include ICIMSHelper
  before :each do
    stub_icims_request(get_response)
  end

  describe '::find' do

    it 'finds a job' do
      job = ICIMS::Job.find(123)
      expect(job).to be_a ICIMS::Job
      expect(job.jobtitle).to eq "Senior Software Engineer - Infrastructure Software Services"
    end

    it 'finds many jobs' do
      jobs = ICIMS::Job.find([123, 1234])
      expect(jobs).to be_a Array
    end

    it 'allows additional fields' do
      job = ICIMS::Job.find(123, fields: [:id, :jobtitle, :positioncategory, :positiontype, :overview])
      expect(job).to be_a ICIMS::Job
    end

  end

  describe '::search' do

    it 'searches for jobs' do
      jobs = ICIMS::Job.search([{name: 'job.id', value: ['1000'], operator: '='}])
      expect(jobs).to be_a Array
      expect(jobs.first).to be_a ICIMS::Job
      expect(jobs.length).to eq 3
    end

  end

  describe '::approved' do

    it 'returns all approved jobs' do
      jobs = ICIMS::Job.approved
      expect(jobs).to be_a Array
      expect(jobs.first).to be_a ICIMS::Job
    end

  end

end