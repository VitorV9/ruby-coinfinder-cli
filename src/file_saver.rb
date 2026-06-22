require 'json'

class FileSaver
  def initialize(caminho_arquivo)
    @caminho_arquivo = caminho_arquivo
  end

  def salvar(dados_conversao)
    if File.exist?(@caminho_arquivo)
      texto_antigo = File.read(@caminho_arquivo)
      historico = JSON.parse(texto_antigo) 
    else
      historico = [] 
    end

    historico << dados_conversao

    texto_json = JSON.generate(historico)
    File.write(@caminho_arquivo, texto_json)
  end
end