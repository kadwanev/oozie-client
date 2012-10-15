class OozieClient

  class Config
    attr_reader :oozie_url
    attr_reader :client

    def initialize(oozie_url, options={})
      @oozie_url = oozie_url
      net_options = options.select { |key| [:user, :password, :headers, :timeout, :open_timeout].member? key }
      net_options[:timeout] ||= 20
      net_options[:open_timeout] ||= 5
      @client = RestClient::Resource.new "#{oozie_url}/v1", net_options
    end
  end

end