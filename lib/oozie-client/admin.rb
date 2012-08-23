class OozieClient
  class Admin
    include Base

    def build_version
      JSON.parse(admin_url('build-version').get)
    end

    def status
      JSON.parse(admin_url('status').get)
    end

    def safemode= safemode
      admin_url('status').put('', {'params' => {'safemode' => !!safemode}})
    end

    def os_env
      JSON.parse(admin_url('os-env').get)
    end

    def java_sys_properties
      JSON.parse(admin_url('java-sys-properties').get)
    end

    def configuration
      JSON.parse(admin_url('configuration').get)
    end

    def instrumentation
      JSON.parse(admin_url('instrumentation').get)
    end

  end

end