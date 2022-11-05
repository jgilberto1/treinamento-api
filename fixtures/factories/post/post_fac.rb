class RequestPost
    def self.post
    endpoint = OpenStruct.new
    endpoint['userId'] = API_DATA_POST['post']['userId']
    endpoint['id'] = API_DATA_POST['post']['id']
    endpoint['title'] = API_DATA_POST['post']['title']
    endpoint['body'] = API_DATA_POST['post']['body']
    endpoint.marshal_dump
    end

end