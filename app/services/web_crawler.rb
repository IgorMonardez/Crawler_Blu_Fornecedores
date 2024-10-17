# frozen_string_literal: true

class WebCrawler

  CLASS_NOME_SEGMENTOS ||= "cfevtU"
  CLASS_FORNECEDORES ||= "kQbLAY"
  CLASS_NOME_FORNECEDOR ||= "cunCrG"
  CLASS_NOME_REGIAO ||= "bkPOGA"

  def initialize(url = "https://fornecedores.blu.com.br/")
    @url = url
  end

  def extract_data
    @driver = Selenium::WebDriver.for :remote, url: ENV["SELENIUM_URL"], capabilities: :firefox
    @driver.get(@url)

    gera_segmentos(@driver)

    gera_fornecedores_regioes(@driver)

    @driver.close
  end

  private

  # @param [Selenium::WebDriver::Firefox::Driver]
  def gera_segmentos(driver)
    sleep(2)

    nome_segmentos = driver.find_elements(:class, CLASS_NOME_SEGMENTOS)

    nome_segmentos.each do |segmento|
      Segmento&.create(nome: segmento.text)
    end
  end

  # @param [Selenium::WebDriver::Firefox::Driver]
  def gera_fornecedores_regioes(driver)
    count_segmentos = Segmento.count


    count_segmentos.times do |index|
      link = driver.find_elements(:class, CLASS_NOME_SEGMENTOS)[index]
      sleep(3)
      nome_segmento = link&.text

      link&.click
      sleep(3)
      fornecedores = driver.find_elements(:class, "kQbLAY")
      fornecedores.each do |fornecedor|
        fornecedor&.click

        @driver.switch_to.window(@driver.window_handles.last)
        sleep(3)
        nome_fornecedor = @driver.find_element(:class, CLASS_NOME_FORNECEDOR).text

        nome_regiao = @driver.find_elements(:class, CLASS_NOME_REGIAO).last.text

        gera_regiao(nome_regiao)

        gera_fornecedor(nome_fornecedor, nome_regiao, nome_segmento)

        @driver.close
        @driver.switch_to.window(@driver.window_handles.last)
      end


      driver.navigate.back
    end

  end

  def gera_regiao(nome_regiao)
    Regiao&.create(nome: nome_regiao)
  end

  def gera_fornecedor(nome_fornecedor, nome_regiao, nome_segmento)
    segmento = Segmento.find_by(nome: nome_segmento)
    regiao = Regiao.find_by(nome: nome_regiao)
    Fornecedor.create!(nome: nome_fornecedor, regiao: regiao, segmento: segmento)
  end

end
