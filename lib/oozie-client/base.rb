class OozieClient
  module Base
    def initialize options
      @config = options[:config]
    end

    def self.included(base)
      base.class_eval do
        attr_reader :config
      end
    end

    private
      def admin_url path
        @config.client["admin/#{path}"]
      end

      def jobs_url *path
        @config.client["jobs"]
      end

      def job_url *path
        @config.client["job/#{oozie_id}"]
      end

      def properties_to_conf_xml params
        builder = Builder::XmlMarkup.new(:indent => 2)
        xml = builder.configuration do |xb|
          params.each do |name, value|
            xb.property do |xb|
              xb.name(name.to_s)
              xb.value(value.to_s)
            end
          end
        end
      end

  end
end