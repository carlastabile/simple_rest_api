# Helper method to parse response
def json(response)
  JSON.parse(response.body)
end