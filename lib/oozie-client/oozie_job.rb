class OozieClient
  class OozieJob
    include Base

    attr_reader :oozie_id

    def initialize oozie_id, options
      @oozie_id = oozie_id
      super(options)
    end

    def start
      job_url.put('', {'params' => {'action' => 'start'}})
    end

    def suspend
      job_url.put('', {'params' => {'action' => 'suspend'}})
    end
    def resume
      job_url.put('', {'params' => {'action' => 'resume'}})
    end
    def kill
      job_url.put('', {'params' => {'action' => 'kill'}})
    end


    def rerun(properties, params={})
      job_url.put(properties_to_conf_xml(properties), {'params' => {'action' => 'rerun'}.merge(params)})
    end

    def info
      JSON.parse job_url.put({'params' => {'show' => 'info'}})
    end

    def definition
      job_url.put({'params' => {'show' => 'definition'}})
    end

    def log
      job_url.put({'params' => {'show' => 'log'}})
    end

  end
end