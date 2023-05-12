# ruby-cucumber-appium-test
Projeto utilizando Ruby com cucumber e appium para mobile

### Anotações
- Criar devide no Android Studio
- Criar um projeto no RubyMine
- Criar pasta features
  - Aqui seram criados os testes .features com o passo a passo usando o cucumber com a escrita em Gherkin 
- Criar sub paste step_definitions
  - Aqui seram criados os steps em ruby de cada teste e seus cenários criados no arquivo .features
    - A cada Scenario criado rodar o "cucumber" para copiar o step a ser adicionando no arquivo em ruby (.rb)
- Criar pasta support
  - Aqui seram criados as classes:
    - hooks.rb (Aqui vai ter o Before/After do driver que sera setado em cada teste)
    - env.rb (Aqui será configurado os capabilities do app para ser utilizado no driver)
- Elements inspector
  - Abrir Appium Server
  - Selecionar lupa
  - Criar capabilities
  ```
  {
  "appium:deviceName": "Pixel 6 Pro API 33",
  "appium:udid": "emulator-5554",
  "platformName": "Android",
  "appium:platformVersion": "13.0",
  "appium:app": "/home/tqi_dmachado/workspace/ruby-cucumber-appium-test/features/support/PreciseUnitConversion.apk"
  }
  ```
### Lisnks de apoio para ambiente linux
https://gorails.com/setup/ubuntu/20.04
https://installati.one/install-cucumber-ubuntu-20-04/
https://phoenixnap.com/kb/install-ruby-ubuntu
https://www.thelinuxfaq.com/ubuntu/ubuntu-16-04-lts-xenial-xerus/cucumber?type=uninstall
https://www.thelinuxfaq.com/ubuntu/ubuntu-17-04-zesty-zapus/ruby-full?type=uninstall
https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html


### Comandos
Comando para validar os steps
> cucumber

Comando para verificar quais steps estão faltando
> cucumber --dry-run

Validar teste com parâmetros
> cucumber -t @default

Verificar o gem instalado na máquina (appium_lib e o cucumber)
> gem list

Listar devices local
> adb devices


### Passos
- Apos realizar o Start no Appium Server e olhar a lista de devices disponíveis
> adb devices
- Rodar um teste para poder abrir o app no device usando o env.rb criado. Com isso o teste e executado logando as info no appium server executanto o Before e o After do teste
> cucumber -t @wip
