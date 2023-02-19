# Sistema_de_lista

- Sistema de cadastro de Anotações.

# Requisitos do Sistema

- Linguagem Dart
- Firestore (Firebase) como banco de dados
- Utilizando animações
- Versionamento de código com Git

## Sobre

O Sistema irá apresentar ao iniciar a tela de Splash, contendo uma animação e direcionando para a tela de Home Screen do aplicativo, dentro do Aplicativo você poderá realizar o cadastro de algumas anotações passando alguns dados como nome , email , título e a anotação desejada, após cadastrar e selecionar algum item da lista,  poderá ter acesso às anotações realizada, podendo também editar e deletar se desejado.

## Como rodar o Projeto

O sistema foi desenvolvido em flutter , usando o FireBase como banco de dados, e usando o padrão de arquitetura MVC para organização das pastas. Dentro da pasta de componentes foram criados alguns componentes para utilizar dentro do projeto como os inputs, dentro do controller poderá ter acesso a todas as funções principais do projeto como registrar, atualizar e deletar. Na pasta helpers foi criado um Validator para validar os campos a ser preenchido. dentro da pasta Screens você terá as views e para controlar as rotas o arquivo Routes.
