# FCG_TrabalhoFinal - PokeKart
Repositório para o trabalho final de Fundamentos de Computação Gráfica


<img width="807" height="647" alt="image" src="https://github.com/user-attachments/assets/0f11eab7-d602-4f7e-9845-70eae79b9baf" />
<img width="811" height="663" alt="image" src="https://github.com/user-attachments/assets/adf6fd66-b9a9-4e71-83b7-5e8ce0047690" />

# Como Executar:

=== Windows
===================================
Para compilar e executar este projeto no Windows, você possui duas
opções para compilação:

--- Windows com Code::Blocks
-------------------------------------------
Baixe a IDE Code::Blocks em http://codeblocks.org/ e abra o arquivo
"PokeKart.cbp".

**ATENÇÃO**: os "Build targets" padrões (Debug e Release) estão configurados
para Code::Blocks versão 20.03 ou superior, que utiliza MinGW 64-bits. Se você
estiver utilizando versões mais antigas do Code::Blocks (17.12 ou anteriores)
você precisa alterar o "Build target" para "Debug (CBlocks 17.12 32-bit)" ou
"Release (CBlocks 17.12 32-bit)" antes de compilar o projeto.

--- Windows com VSCode (Visual Studio Code)
-------------------------------------------
1) Instale o VSCode seguindo as instruções em https://code.visualstudio.com/ .

2) Instale o compilador GCC no Windows seguindo as instruções em
https://code.visualstudio.com/docs/cpp/config-mingw#_installing-the-mingww64-toolchain .

Alternativamente, se você já possui o Code::Blocks instalado no seu PC
(versão que inclui o MinGW), você pode utilizar o GCC que vem com esta
instalação no passo 5.

3) Instale o CMake seguindo as instruções em https://cmake.org/download/ .
Alternativamente, você pode utilizar algum package manager do
Windows para fazer esta instalação, como https://chocolatey.org/ .

4) Instale as extensões "ms-vscode.cpptools" e "ms-vscode.cmake-tools"
no VSCode. Se você abrir o diretório deste projeto no VSCode,
automaticamente será sugerida a instalação destas extensões (pois
estão listadas no arquivo ".vscode/extensions.json").

5) Abra as configurações da extensão cmake-tools (Ctrl-Shift-P e
busque por "CMake: Open CMake Tools Extension Settings"), e adicione o
caminho de instalação do GCC na opção de configuração "additionalCompilerSearchDirs".

Por exemplo, se você quiser utilizar o compilador MinGW que vem junto
com o Code::Blocks, pode preencher o diretório como
"C:\Program Files\CodeBlocks\MinGW\bin" (verifique se este é o local
de instalação do seu Code::Blocks).

6) Clique no botão de "Play" na barra inferior do VSCode para compilar
e executar o projeto. Na primeira compilação, a extensão do CMake para
o VSCode irá perguntar qual compilador você quer utilizar. Selecione
da lista o compilador GCC que você instalou com o MSYS/MinGW.

Veja mais instruções de uso do CMake no VSCode em:

https://github.com/microsoft/vscode-cmake-tools/blob/main/docs/README.md

=== Linux
===================================
Para compilar e executar este projeto no Linux, primeiro você precisa instalar
as bibliotecas necessárias. Para tanto, execute o comando abaixo em um terminal.
Esse é normalmente suficiente em uma instalação de Linux Ubuntu:

    sudo apt-get install build-essential make libx11-dev libxrandr-dev \
                         libxinerama-dev libxcursor-dev libxcb1-dev libxext-dev \
                         libxrender-dev libxfixes-dev libxau-dev libxdmcp-dev

Se você usa Linux Mint, talvez seja necessário instalar mais algumas bibliotecas:

    sudo apt-get install libmesa-dev libxxf86vm-dev

Após a instalação das bibliotecas acima, você possui várias opções para compilação:

--- Linux com Makefile
-------------------------------------------
Abra um terminal, navegue até a pasta "FCG_TrabalhoFinal", e execute
o comando "make" para compilar. Para executar o código compilado, execute o
comando "make run".

--- Linux com CMake
-------------------------------------------
Abra um terminal, navegue até a pasta "FCG_TrabalhoFinal", e execute
os seguintes comandos:

    mkdir build  # Cria diretório de build
    cd build     # Entra no diretório
    cmake ..     # Realiza a configuração do projeto com o CMake
    make         # Realiza a compilação
    make run     # Executa o código compilado

--- Linux com VSCode
-------------------------------------------

1) Instale o VSCode seguindo as instruções em https://code.visualstudio.com/ .

2) Instale as extensões "ms-vscode.cpptools" e "ms-vscode.cmake-tools"
no VSCode. Se você abrir o diretório deste projeto no VSCode,
automaticamente será sugerida a instalação destas extensões (pois
estão listadas no arquivo ".vscode/extensions.json").

3) Clique no botão de "Play" na barra inferior do VSCode para compilar
e executar o projeto. Na primeira compilação, a extensão do CMake para
o VSCode irá perguntar qual compilador você quer utilizar. Selecione
da lista o compilador que você deseja utilizar.

Veja mais instruções de uso do CMake no VSCode em:

https://github.com/microsoft/vscode-cmake-tools/blob/main/docs/README.md

--- Linux com Code::Blocks
-------------------------------------------
Instale a IDE Code::Blocks (versão Linux em http://codeblocks.org/), abra o
arquivo "PokeKart.cbp", e modifique o "Build target" de "Debug" para "Linux".

=== macOS
===================================
Para compilar e executar esse projeto no macOS, primeiro você precisa instalar o
HOMEBREW, um gerenciador de pacotes para facilitar a instação de bibliotecas. O
HOMEBREW pode ser instalado com o seguinte comando no terminal:

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Após a instalação do HOMEBREW, a biblioteca GLFW deve ser instalada. Isso pode
ser feito pelo terminal com o comando:

    brew install glfw

--- macOS com Makefile
-------------------------------------------
Abra um terminal, navegue até a pasta "FCG_TrabalhoFinal", e execute
o comando "make -f Makefile.macOS" para compilar. Para executar o código
compilado, execute o comando "make -f Makefile.macOS run".

Observação: a versão atual da IDE Code::Blocks é bastante desatualizada pra o
macOS. A nota oficial dos desenvolvedores é: "Code::Blocks 17.12 for Mac is
currently not available due to the lack of Mac developers, or developers that
own a Mac. We could use an extra Mac developer (or two) to work on Mac
compatibility issues."


# Manual de Atalhos:
Tecla A, W, S, D -  usadas na movimentação do veiculo principal nas direções de esquerda, frentes, trás, direita, respectivamente.
Tecla C - usada para alternar entre as câmeras livre e lookat.
Teclas LEFT, UP, DOWN e RIGHT - usadas para a movimentação da camera livre.
Tecla ENTER - iniciar o jogo
Mouse - usado para controle do ângulo da camera em qualquer um dos casos.
Tecla R - reinicia o jogo

# Contribuições
- Bruno: a partir do Laboratório 5 completo, fiz subi os modelos dos Pokemon e do carro e texturizei eles, além de colocar texturas nos planos que compõe a estrada e o chão e criar uma esfera externa para simular um céu. Fiz a implementações da cameras câmeras livre e look-at. Implementei a curva de bezier no carro competidor e inclui os modelos de iluminação e interpolação desejados.
- Luana: implementei a movimentação do carro do jogador, incluindo controle suave baseado no tempo, e desenvolvi todo o sistema de colisões do jogo. Também criei a lógica completa da corrida, com checkpoints, linha de chegada e verificação de vitória ou derrota. Além disso, implementei os efeitos sonoros, como som de vitória e derrota, e participei do posicionamento e ajuste visual dos elementos da pista.

# Uso de IA Generativa para código
O uso se deu para facilitar o debug, além de encontrar soluções para problemas que consumiram muito tempo, como a rendenização de modelos com diversas partes. Também foi de grande utilidade para aprender sobre maiores detalhes das funções de OpenGL que não haviam sido completamente explorados por nós nos laboratórios, além de trazer novas funções que permitissem realizar tarefas mais complexas.

A utilidade da ferramenta vem da velocidade como ela consegue encontrar informações para auxiliar no desenvolvimento, assim como encontrar erros de execução que perderíamos muito tempo buscando. As maiores dificuldades da ferramenta se mostram em eventuais alucinações e dificuldades de tratamento com contextos muito longos, mas ainda assim acredito que ela tenha tido um auxílio importante no desenvolvimento do trabalho

# Desenvolvimento da Aplicação e Uso do Conceito de FCG

A partir do Lab 5, os passos foram os seguintes:

1. Pesquisa de modelos e texturas para a cena. Enfrentamos dificuldades para conseguir implementar objetos com múltiplas partes e texturas. Muito desse momento inicial do desenvolvimento também se relacionou com o aprendizado de como lidar com outros tipos de modelos em OpenGL para além dos vistos em aula e modificar suas matrizes além de lidar com sua importação para dentro do projeto.

2. Ainda sem ter resolvido completamente a etapa anterior, começamos a trabalhar nas movimentações do carro e da cêmera livre, que seguem lógicas similares em nossa implementação. Nesse momento, começamos a enfrentar problemas com as configurações do CodeBlocks de forma que isso atrasou o desenvolvimento em alguns dias.

3. Resolvidos os problemas técnicos e dos modelos, conseguimos desenvolver muito rapidamente muitos dos requisitos, pela maior familiaridade que adquirimos no processo com a linguagem. Nesse momento, a maior dificuldade foram os modelos de iluminação, que deixamos para o final, priorizando outras features que permitiram com que chegassemos em um resultado que consideramos bom do trabalho.

OBS: O modelo de iluminação Blinn-Phong já foi implementado após a apresentação, sendo aplicado aos carros.
