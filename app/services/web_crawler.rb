# frozen_string_literal: true

class WebCrawler

  def initialize(url = "https://fornecedores.blu.com.br/")
    @url = url
  end

  def extract_data
    driver = Selenium::WebDriver.for :firefox
    driver.get(@url)

    gera_segmentos(driver)
  end

  private

  # @param [Selenium::WebDriver::Firefox::Driver]
  def gera_segmentos(driver)
    nome_segmentos = driver.find_elements(:class, "cfevtU")

    nome_segmentos.each do |segmento|
      Segmento.create!(nome: segmento.text)
    end
  end
end
