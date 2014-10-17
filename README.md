# iCIMS API Integration

Simple wrapper around iCIMS API to avoid technicalities around their workflow.

## Getting Started

Create an initializer file to setup iCIMS credentials. I suggest using DotEnv to keep it secret.

```
# config/initializers/icims.rb
ICIMS.setup do |config|
  config.username    = ENV['ICIMS_API_USER']
  config.password    = ENV['ICIMS_API_PASS']
  config.customer_id = ENV['ICIMS_API_CUSTOMER']
end
```

## Usage

### Find single record

`ICIMS::Job.find(123)` where 123 is iCIMS record id and will return a ICIMS::Job instance.
Optional `fields` parameter

### Approved jobs

`ICIMS::Job.approved` returns approved and posted jobs

### Search for jobs

`ICIMS::Job.search(fields)` relies on iCIMS query interface to define filters.

```
filters = [
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
          ]
ICIMS::Job.search(filters)
```

## Contributing

Once you've made your great commits:

- Fork icims
- Create a topic branch - git checkout -b my_branch
- Push to your branch - git push origin my_branch
- Create an Issue with a link to your branch
- That's it!


This project rocks and uses MIT-LICENSE.