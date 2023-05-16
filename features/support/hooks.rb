Before do
  #puts "Iniciando o cenário: #{scenario.name}"
  $driver.start_driver
  # Implemente o código de inicialização, se necessário
  # Exemplo: Limpar cache, reiniciar o aplicativo, etc.
  # delete_screenshots
end

After do  |scenario|

  if !File.directory?("screnshots")
    FileUtils.mkdir_p("screnshots")
  end

  # Depois de cada cenário de teste
  if scenario.passed?
    # Caso o cenário tenha falhado, tire um screenshot do aplicativo e salve-o
    screenshot_name = "success-#{scenario.name}-screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    screenshot_path = File.join(Dir.pwd, 'screenshots', screenshot_name)
    $driver.screenshot(screenshot_path)
    puts "Screenshot salvo em: #{screenshot_path}"
  elsif scenario.failed?
    # Caso o cenário tenha falhado, tire um screenshot do aplicativo e salve-o
    screenshot_name = "failed-#{scenario.name}-screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    screenshot_path = File.join(Dir.pwd, 'screenshots', screenshot_name)
    $driver.screenshot(screenshot_path)
    puts "Screenshot salvo em: #{screenshot_path}"
  end

  $driver.driver_quit
end

AfterStep do
  # Depois de cada etapa do cenário de teste
  # Implemente o código para fazer uma pausa, se necessário
  # Exemplo: Aguardar um momento para visualizar a interação na interface do aplicativo
  sleep 1
end

Around('@time_sensitive') do |scenario, block|
  # Executado em torno de cada cenário marcado com a tag @time_sensitive
  # Implemente o código para alterar a data/hora do dispositivo durante a execução do cenário
  original_time = Time.now
  new_time = Time.parse('2023-01-01 12:00:00')
  Timecop.freeze(new_time) do
    block.call
  end
  Timecop.return
  Timecop.freeze(original_time)
end


# Realiza o delete dos printsScreen
def delete_screenshots
  # Deleta os arquivos de screenshot existentes
  screenshots_dir = File.join(Dir.pwd, 'screenshots')
  FileUtils.rm_rf(Dir.glob("#{screenshots_dir}/*.png"))
end

#Executa a ação de scroll
def find_in_list(value)
  start_x = 0.5
  start_y = 0.2 # tamanho inicial
  end_x = 0.5
  end_y = 0.6 # tamanho máximo

  #3.times executar o codigo 2 vezes
  3.times do  Appium::TouchAction.new.swipe(
    start_x: start_x,
    start_y: start_y,
    end_x: end_x,
    end_y: end_y,
    duration:600).perform
  end

  # obter todo o objeto da pagina para verificação
  current_screen = get_source
  previous_screen = ""

  #Após aplicar o scroll se o objeto existir voltar o scroll
  until (exists{ find_element(xpath: "//android.widget.TextView[@text='#{value}']") }) ||(current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(
      start_x: end_x,
      start_y: end_y,
      end_x: start_x,
      end_y: start_y,
      duration:600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists{ find_element(xpath: "//android.widget.TextView[@text='#{value}']") }
    find_element(xpath: "//android.widget.TextView[@text='#{value}']").click
  else
    fail("Elemento com o texto ""#{value}"" não encontrado na tela.")
  end

end