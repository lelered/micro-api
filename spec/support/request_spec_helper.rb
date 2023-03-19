module RequestSpecHelper
  def json
    @json ||= JSON.parse(response.body)
  rescue
    @json ||= nil
  end
end
