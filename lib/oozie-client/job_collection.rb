class OozieClient

  class JobCollection
    include Base
    include Enumerable

    def initialize options
      @filters = options[:filters] || {}
      super
    end

    def [] oozie_id
      OozieJob.new(oozie_id, :config => config)
    end

    def create(properties, params={})
      job = JSON.parse jobs_url.post(properties_to_conf_xml(properties), {params: params, content_type: :xml})
      self[job['id']]
    end
    alias_method :submit, :create

    def with_user *users
      filter(:user, users.flatten)
    end

    def with_name *names
      filter(:name, names.flatten)
    end

    def with_group *groups
      filter(:group, groups.flatten)
    end

    def with_status *statuses
      filter(:status, statuses.flatten)
    end

    def filter name, value
      options = {}
      options[:filters] = @filters.merge(name.to_s.to_sym => value)
      options[:config] = config
      JobCollection.new(options)
    end

    def each
      result = JSON.parse jobs_url.get
      result['workflows'].each { |wf| yield self[wf['id']] }
    end

  end

end