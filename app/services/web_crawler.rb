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
    @driver = Selenium::WebDriver.for :firefox
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
      Segmento.create!(nome: segmento.text)
    end
  end

  # @param [Selenium::WebDriver::Firefox::Driver]
  def gera_fornecedores_regioes(driver)
    links = driver.find_elements(:class, CLASS_NOME_SEGMENTOS)

    links.each do |link|
      sleep(3)
      segmento = link&.text

      link&.click
      sleep(3)
      fornecedores = driver.find_elements(:class, "kQbLAY")
      fornecedores.each do |fornecedor|
        fornecedor&.click

        @driver.switch_to.window(@driver.window_handles.last)
        sleep(3)
        nome_fornecedor = @driver.find_element(:class, CLASS_NOME_FORNECEDOR).text

        nome_regiao = @driver.find_elements(:class, CLASS_NOME_REGIAO).last.text

        regiao = gera_regiao(nome_regiao)

        gera_fornecedor(nome_fornecedor, regiao, segmento)

        @driver.close
      end


      driver.navigate.back
    end

  end

  def gera_regiao(nome_regiao)
    Regiao&.create(nome: nome_regiao)
  end

  def gera_fornecedor(nome_fornecedor, regiao, nome_segmento)
    segmento = Segmento.find_by(nome: nome_segmento)
    Fornecedor.create!(nome: nome_fornecedor, regiao: regiao, segmento: segmento)
  end

end
