
#!/bin/bash

Nome : Autor Vinicius Dreyer De Araujo
# Script para efetuar o backup de arquivos usando os comandos Rsync ou Scp.

principal() {           
 # Fun��o principal do programa
    clear                       

    echo [1] Definir arquivo    - imprime na tela as op��es que ser�o abordadas no comando case.
    echo [2] Definir diret�rio" 
    echo [3] Definir caminho
    echo [4] Definir socket
    echo [5] Definir software de backup
    echo [6] Efetuar backup
    echo [7] Sair
    echo ""
    echo -n - Qual a opcao desejada ? 
    read opcao          
  faz a leitura da vari�vel "opcao', 
                                  # que ser� utilizada no comando case
                                  # para indicar qual a op��o a ser utilizada

                                  # caso o valor da vari�vel "opcao"...
    case $opcao in
        1)                        # seja igual a "1", ent�o fa�a as instru��es abaixo
            clear
            define_arquivo        # executa os comandos da fun��o "define_arquivo"
            ;;          
     # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        2)              
 # seja igual a "2", ent�o fa�a as instru��es abaixo
            clear
            define_diretorio      
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        3)              
 # seja igual a "3", ent�o fa�a as instru��es abaixo
            clear
            define_caminho        
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        4)              
 # seja igual a "4", ent�o fa�a as instru��es abaixo
            clear
            define_socket     
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        5)              
 # seja igual a "5", ent�o fa�a as instru��es abaixo
            clear
            define_software       
            ;;             
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        6)              
 # seja igual a "6", ent�o fa�a as instru��es abaixo
            clear
            efetua_backup     
            ;;          
 # os 2 ";;" (ponto e virgula)
 # significam que chegou ao final
 # esta op��o do comando case
        7)
            clear
            exit ;;
        *)              
 # esta op�ao existe para caso o usu�rio digite um 
 # valor diferente de 1, 2 ou 3
            opcao_invalida ;;
 # opcao inv�lida.
    esac
}

define_arquivo() {      # fun��o da op��o define_arquivo
    clear # limpa tela
    echo "Qual o nome completo e extens�o do arquivo que deseja copiar? [Use *,para todos os arquivos de um diret�rio]" # intera��o com usu�rio
    read nomeArquivo  # efetua a leitura de entradas para � vari�vel
    read pause # usado para pausar a execu��o do script
    principal # volta para a fun��o principal
}

define_diretorio() {    # fun��o da op��o define_diretorio
    clear # limpa tela
    echo "Qual o nome do diret�rio que deseja copiar? [Especifique corretamente letras mau�sculas e minusculas Exemplo: Documents]"
# intera��o com usu�rio
    echo "Voc� tambem pode colocar a refer�ncia absoluta: [Exemplo: /home/user/Downloads/]"
# intera��o com usu�rio
    read nomeDiretorio  # efetua a leitura de entradas para � vari�vel
    read pause # usado para pausar a execu��o do script
    principal # volta para a fun��o principal
}

define_caminho() {  # fun��o da op��o define_caminho
    clear # limpa tela
    echo "Qual a refer�ncia completa do caminho de destino para onde deseja copiar [Exemplo: ~/Documents]"
# intera��o com usu�rio
    read nomeCaminho   # efetua a leitura de entradas para � vari�vel
    read pause          
 # usado para pausar a execu��o do script
    principal           
 # volta para a fun��o principal
}

define_socket() {  # fun��o da op��o define_socket
    clear # limpa tela
    echo "Qual o IP de conex�o remota para backup?"
# intera��o com usu�rio
    read enderecoIp  # efetua a leitura de entradas para � vari�vel
    echo "Qual a porta SSH padr�o do host remoto?"
# intera��o com usu�rio
    read portaSsh  # efetua a leitura de entradas para � vari�vel
    echo "Qual o usu�rio remoto para efetuar o backup?"
# intera��o com usu�rio
    read usuarioBackup  # efetua a leitura de entradas para � vari�vel
    read pause          # usado para pausar a execu��o do script
    principal      # volta para a fun��o principal
}

define_software() {  # fun��o da op��o define_software
    clear # limpa tela
    echo "Qual o software que deseja usar para o backup? - [1] RSYNC | [2] SCP]"
# intera��o com usu�rio
    read sBackupLuis
# efetua a leitura de entradas para � vari�vel
echo "teste"
    clear # limpa tela
    if test $sBackupLuis -eq 1
# inicio if
then
clear
# limpa tela
echo "Fun��o RSYNC escolhida."
# intera��o com usu�rio
principal

    elif test $sBackupLuis -eq 2
then
clear
# limpa tela
echo "Fun��o SCP escolhida."
# intera��o com usu�rio
principal
# volta para a fun��o principal

    else
clear
# limpa tela
echo "Op��o inv�lida."
# intera��o com usu�rio
define_software
    fi
    read pause # usado para pausar a execu��o do script
    principal # volta para a fun��o principal
}
efetua_backup(){  # fun��o da op��o efetua_backup
    clear
    echo "EFETUADO BACKUP CONFORME DADOS PASSADOS...]"
# intera��o com usu�rio
     if test $sBackupLuis -eq 1
# inicio if
then
clear
# limpa tela
echo "Utilizando RSYNC..."
# intera��o com usu�rio
rsync -vzha -e 'ssh -p $portaSsh' --progress $nomeDiretorio/$nomeArquivo $usuarioBackup@$enderecoIp:$nomeCaminho # fun��o rsync
    elif test $sBackupLuis -eq 2
then
clear
# limpa tela
echo "Utilizando SCP..."
# intera��o com usu�rio
scp -vP $portaSsh $nomeDiretorio/$nomeArquivo $usuarioBackup@$enderecoIp:$nomeCaminho
# fun�ao scp
    else
clear
# limpa tela
echo "Op��o inv�lida."
# intera��o com usu�rio
echo "N�o foi possivel fazer o backup, cancele a execu��o do script e repita o processo."
# intera��o com usu�rio
    fi
    echo "Script finalizado, verifique o backup!"
# intera��o com usu�rio
    read pause # usado para pausar a execu��o do script
    clear # limpa tela
    exit 0 # sai da aplica��o
}


opcao_invalida() {  # fun��o da op��o inv�lida
    clear # limpa tela
    echo "Opcao desconhecida."
# intera��o com usu�rio
    read pause # usado para pausar a execu��o do script
    principal # volta para a fun��o principal
}

principal               
# o script come�a aqui, as fun��es das linhas anteriores
# s�o lidas pelo interpretador bash e armazenadas na mem�ria.

# o bash n�o tem como adivinhar qual das fun��es ele deve executar, por isto o a execu��o do script realmente come�a
# quando aparece uma instru��o fora de uma fun��o, neste caso, chamando a fun��o principal

