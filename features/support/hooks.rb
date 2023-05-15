Before do
  #puts "Iniciando o cenário: #{scenario.name}"
  $driver.start_driver
  # Implemente o código de inicialização, se necessário
  # Exemplo: Limpar cache, reiniciar o aplicativo, etc.
  # delete_screenshots
end

After do  |scenario|
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


def delete_screenshots
  # Deleta os arquivos de screenshot existentes
  screenshots_dir = File.join(Dir.pwd, 'screenshots')
  FileUtils.rm_rf(Dir.glob("#{screenshots_dir}/*.png"))
end