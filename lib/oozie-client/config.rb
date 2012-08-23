class OozieClient

  class Config
    attr_reader :oozie_url
    attr_reader :client

    def initialize oozie_url
      @oozie_url = oozie_url
      @client = RestClient::Resource.new "#{oozie_url}/v1"
    end
  end

end