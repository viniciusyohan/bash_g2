
#!/bin/bash

Nome : Autor Vinicius Dreyer De Araujo
# Script para efetuar o backup de arquivos usando os comandos Rsync ou Scp.

principal() {           
 # Função principal do programa
    clear                       

    echo [1] Definir arquivo    - imprime na tela as opções que serão abordadas no comando case.
    echo [2] Definir diretório" 
    echo [3] Definir caminho
    echo [4] Definir socket
    echo [5] Definir software de backup
    echo [6] Efetuar backup
    echo [7] Sair
    echo ""
    echo -n - Qual a opcao desejada ? 
    read opcao          
  faz a leitura da variável "opcao', 
                                  # que será utilizada no comando case
                                  # para indicar qual a opção a ser utilizada

                                  # caso o valor da variável "opcao"...
    case $opcao in
        1)                        # seja igual a "1", então faça as instruções abaixo
            clear
            define_arquivo        # executa os comandos da função "define_arquivo"
            ;;          
     # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        2)              
 # seja igual a "2", então faça as instruções abaixo
            clear
            define_diretorio      
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        3)              
 # seja igual a "3", então faça as instruções abaixo
            clear
            define_caminho        
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        4)              
 # seja igual a "4", então faça as instruções abaixo
            clear
            define_socket     
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        5)              
 # seja igual a "5", então faça as instruções abaixo
            clear
            define_software       
            ;;             
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        6)              
 # seja igual a "6", então faça as instruções abaixo
            clear
            efetua_backup     
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta opção do comando case
        7)
            clear
            exit ;;
        *)              
 # esta opçao existe para caso o usuário digite um 
 # valor diferente de 1, 2 ou 3
            opcao_invalida ;;
 # opcao inválida.
    esac
}

define_arquivo() {      # função da opção define_arquivo
    clear # limpa tela
    echo "Qual o nome completo e extensão do arquivo que deseja copiar? [Use *,para todos os arquivos de um diretório]" # interação com usuário
    read nomeArquivo  # efetua a leitura de entradas para á variável
    read pause # usado para pausar a execução do script
    principal # volta para a função principal
}

define_diretorio() {    # função da opção define_diretorio
    clear # limpa tela
    echo "Qual o nome do diretório que deseja copiar? [Especifique corretamente letras mauísculas e minusculas Exemplo: Documents]"
# interação com usuário
    echo "Você tambem pode colocar a referência absoluta: [Exemplo: /home/user/Downloads/]"
# interação com usuário
    read nomeDiretorio  # efetua a leitura de entradas para á variável
    read pause # usado para pausar a execução do script
    principal # volta para a função principal
}

define_caminho() {  # função da opção define_caminho
    clear # limpa tela
    echo "Qual a referência completa do caminho de destino para onde deseja copiar [Exemplo: ~/Documents]"
# interação com usuário
    read nomeCaminho   # efetua a leitura de entradas para á variável
    read pause          
 # usado para pausar a execução do script
    principal           
 # volta para a função principal
}

define_socket() {  # função da opção define_socket
    clear # limpa tela
    echo "Qual o IP de conexão remota para backup?"
# interação com usuário
    read enderecoIp  # efetua a leitura de entradas para á variável
    echo "Qual a porta SSH padrão do host remoto?"
# interação com usuário
    read portaSsh  # efetua a leitura de entradas para á variável
    echo "Qual o usuário remoto para efetuar o backup?"
# interação com usuário
    read usuarioBackup  # efetua a leitura de entradas para á variável
    read pause          # usado para pausar a execução do script
    principal      # volta para a função principal
}

define_software() {  # função da opção define_software
    clear # limpa tela
    echo "Qual o software que deseja usar para o backup? - [1] RSYNC | [2] SCP]"
# interação com usuário
    read sBackupLuis
# efetua a leitura de entradas para á variável
echo "teste"
    clear # limpa tela
    if test $sBackupLuis -eq 1
# inicio if
then
clear
# limpa tela
echo "Função RSYNC escolhida."
# interação com usuário
principal

    elif test $sBackupLuis -eq 2
then
clear
# limpa tela
echo "Função SCP escolhida."
# interação com usuário
principal
# volta para a função principal

    else
clear
# limpa tela
echo "Opção inválida."
# interação com usuário
define_software
    fi
    read pause # usado para pausar a execução do script
    principal # volta para a função principal
}
efetua_backup(){  # função da opção efetua_backup
    clear
    echo "EFETUADO BACKUP CONFORME DADOS PASSADOS...]"
# interação com usuário
     if test $sBackupLuis -eq 1
# inicio if
then
clear
# limpa tela
echo "Utilizando RSYNC..."
# interação com usuário
rsync -vzha -e 'ssh -p $portaSsh' --progress $nomeDiretorio/$nomeArquivo $usuarioBackup@$enderecoIp:$nomeCaminho # função rsync
    elif test $sBackupLuis -eq 2
then
clear
# limpa tela
echo "Utilizando SCP..."
# interação com usuário
scp -vP $portaSsh $nomeDiretorio/$nomeArquivo $usuarioBackup@$enderecoIp:$nomeCaminho
# funçao scp
    else
clear
# limpa tela
echo "Opção inválida."
# interação com usuário
echo "Não foi possivel fazer o backup, cancele a execução do script e repita o processo."
# interação com usuário
    fi
    echo "Script finalizado, verifique o backup!"
# interação com usuário
    read pause # usado para pausar a execução do script
    clear # limpa tela
    exit 0 # sai da aplicação
}


opcao_invalida() {  # função da opção inválida
    clear # limpa tela
    echo "Opcao desconhecida."
# interação com usuário
    read pause # usado para pausar a execução do script
    principal # volta para a função principal
}

principal               
# o script começa aqui, as funções das linhas anteriores
# são lidas pelo interpretador bash e armazenadas na memória.

# o bash não tem como adivinhar qual das funções ele deve executar, por isto o a execução do script realmente começa
# quando aparece uma instrução fora de uma função, neste caso, chamando a função principal

