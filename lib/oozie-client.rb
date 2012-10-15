require 'oozie-client/version'

require 'json'
require 'builder'

require 'oozie-client/base'
require 'oozie-client/config'
require 'oozie-client/job_collection'
require 'oozie-client/admin'
require 'oozie-client/oozie_job'
require 'rest-client'

class OozieClient
  attr_reader :config

  def initialize(oozie_url, options={})
    @config = Config.new(oozie_url, options)
  end

  def admin
    Admin.new(config: config)
  end

  def jobs
    JobCollection.new(config: config)
  end

end
