Dado('ter uma massa configurada do endpoint adicionar post') do
    @novo_post = RequestPost.post
end
  
Quando('enviar as informacoes através do verbo post') do
    @novo_post = post.addPost(@novo_post)
end
  
Então('receberei o codigo de sucesso trazido da requisicao') do
  endpoint = @novo_post
  expect(endpoint.response.code.to_i).to eql 201
end