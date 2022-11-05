module Bff
    module Rest
      class Post
        include HTTParty
  
        headers 'Content-Type' => 'application/json'
        base_uri "#{URL[AMBIENTE]}"
  
        def addPost(request)
          response = self.class.post("#{ENDPOINT['posts']}", body: request.to_json)
          ApiCommons.generate_evidence response
          response
        end
    end
end
end
  