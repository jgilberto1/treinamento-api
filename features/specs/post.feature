#language:pt

@InformarSobreTags @TagGeralDaFincionalidade
Funcionalidade: Testes no jsonPlaceHolder
    Breves informações sobre a funcionalidade.

@Post 
Cenário: Criar um novo post no jsonPlaceholder
    Dado ter uma massa configurada do endpoint adicionar post
    Quando enviar as informacoes através do verbo post
    Então receberei o codigo de sucesso trazido da requisicao