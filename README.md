# Aplicativo de Simulação do Jogo General


## Descrição

Este é um aplicativo Android desenvolvido em Flutter que simula a jogabilidade do clássico jogo de dados General. O aplicativo permite aos usuários jogarem com 5 dados, seguindo as regras do jogo, onde eles têm até três rotações para alcançar a melhor pontuação possível.

## Funcionalidades

1. Rolar Dados
Ao clicar no botão "Rolar Dados", o aplicativo gera aleatoriamente 5 números que são representados visualmente por dados na tela.

2. Limite de Rotações
O jogador está limitado a três rotações dos dados em cada rodada do jogo. Após a terceira rotação, o usuário precisará iniciar um novo jogo.

3. Seleção e Desseleção de Dados
Os usuários podem tocar em dados individuais para selecioná-los ou desselecioná-los. Quando um dado é selecionado, ele não será rolado nas jogadas subsequentes, permitindo que o jogador mantenha os valores desejados.

4. Volta ao Local de Rotação
Se um dado for selecionado acidentalmente ou se o jogador mudar de ideia, tocar novamente no dado selecionado o devolverá à posição inicial, onde será rolado com os outros dados na próxima jogada.

## Capturas de Tela

<p float="left">
  <img src="https://drive.google.com/uc?export=view&id=1Rkn7kLr8z3W91cXpcpf_Ur8TmINoUbSK" alt="Captura de tela inicial" width="200">
  <img src="https://drive.google.com/uc?export=view&id=1Ufsu23hU1vC7eGGMdf_5kFqUKI_zoZNs" alt="Captura com dados selecionados" width="200">
</p>


## Pré-requisitos

Certifique-se de ter o Flutter instalado em seu ambiente de desenvolvimento. Se você ainda não o tem, siga as instruções na [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install) para configurar seu ambiente.


## Como Usar

1. Clone este repositório em sua máquina local:

   ```
   https://github.com/IpCarrara/General.git
   ```

2. Navegue até o diretório do projeto:

   ```
   cd general
   ```

3. Execute o aplicativo com o comando:

   ```
   flutter run
   ```

4. O aplicativo será lançado no seu dispositivo ou emulador.


## Licença

Este projeto está sob a Licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter mais detalhes.


## Agradecimentos

- Flutter (https://flutter.dev) por disponibilizar uma estrutura de desenvolvimento incrível.