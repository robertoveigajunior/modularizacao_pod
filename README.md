# Modularização iOS

Modularização iOS

Basicamente os aplicativos de grande porte contem muitos fluxos e telas ou até mesmo arquivos descontinuados, desta forma pesado para rodar testes ou até mesmo na hora do build.

Quem aqui já teve este problema ou já ficou sabendo de alguém que estava chateado com esse problema?

Troucemos aqui uma solução bem bacana!

Existem algumas formas de resolver isso, uma delas é bem conhecia como POD, que é administrado por um gerenciador de dependências chamado COCOAPODS, utilizado em mais de 3 milhões de apps no mundo. 

Primeiro comando para criar o seu POD:

```
$ pod lib create MyLib
```

Caso necessário crie com um template adicionando --template-url=URL no comando.

```
$ pod lib create [MyLib] --template-url=[URL]
```

Criar bibliotecas como dependências do projeto principal, simplifica e encapsula as funcionalidades. 

Vamos construir um simples projeto contendo um app principal que utiliza componentes desenvolvidos de maneira desacoplada.

## Configuração

Configurando o podspec, ele é construido automaticamente quando o POD é criado.

Atenção para as seguintes exemplos de códigos dentro do podspec.

``` 
s.source_files = 'teste/Classes/**/*' 
```

``` 
s.dependency 'AFNetworking', '~> 2.3' 
```

``` 
s.frameworks = 'UIKit', 'MapKit' 
```

```
s.resource_bundles = {
  'teste' => ['teste/Assets/*.png']
}
```

## Referência

[CocoaPods](https://cocoapods.org). 

## Autor

Roberto Luiz Veiga Junior

## Licença

MIT license.
