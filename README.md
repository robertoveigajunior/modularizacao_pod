# Modularização iOS

Basicamente os aplicativos de grande porte contem muitos fluxos e telas ou até mesmo arquivos descontinuados, desta forma pesado para rodar testes ou até mesmo na hora do build.

Quem aqui já teve este problema ou já ficou sabendo de alguém que estava chateado com esse problema?

Trouxemos aqui uma solução bem bacana!

Existem algumas formas de resolver isso, uma delas é bem conhecia como POD, que é administrado por um gerenciador de dependências chamado COCOAPODS, utilizado em mais de 3 milhões de apps no mundo. 

Primeiro comando para criar o seu POD:

```
$ pod lib create MyLib
```

Caso necessário crie com um template adicionando --template-url=URL no comando.

```
$ pod lib create MyLib --template-url=https://github.com/robertoveigajunior/modularizacao_pod.git
```

Criar bibliotecas como dependências do projeto principal, simplifica e encapsula as funcionalidades. 

Vamos construir um simples projeto contendo um app principal que utiliza componentes desenvolvidos de maneira desacoplada.

## Configuração

Configurando o podspec, ele é construído automaticamente quando o POD é criado.

Atenção para as seguintes exemplos de códigos dentro do podspec.

```
s.source_files = 'teste/Classes/**/*.swift'
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

## Implementando a biblioteca

Acesse o repositório da sua biblioteca.

Primeiro você deve verificar se o Podspec está construído corretamente, pois não é possível implantar com erros.

Isso pode ser feito com dois métodos:
```
pod lib lint
```
e
```
pod spec lint
```

A diferença entre eles é que o [pod lib lint] não acessa a rede, enquanto o [pod spec lint] verifica o repositório externo e a tag associada.

Se você estiver implantando uma biblioteca de código aberto no tronco, não poderá receber avisos do CocoaPods.

Se você estiver implantando em um repositório de especificações particular, precisará já ter adicionado esse repositório. Consulte os guias em repositórios de especificações particulares para configurar isso. Se você estiver implantando em um repositório privado existente, use este comando para implantar:

```
pod repo push SPEC_REPO *.podspec --verbose
```

## Referência

[CocoaPods](https://cocoapods.org).

## Autor

Roberto Luiz Veiga Junior

## Licença

MIT license.
