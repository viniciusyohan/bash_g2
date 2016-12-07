#!/bin/bash


menuprincipal()

{ #principal função desse programa , ele retornará pra cá em caso de alguma opção inválida.
clear
echo "1)Definir os arquivos para backup."
echo "2)Definir os diretórios para backup"
echo "3)Definir os caminhos para backup"
echo "4)Definir IP e porta para backup"
echo
echo -n "Qual a opcao desejada ? "
read opcao #A variável "opcao" será utilizada no comando case para indicar qual a opção a ser utilizada.

case $opcao in
1) #caso o resultado da variavel seja igual a "1", então ele fará as instruções abaixo
clear #limpa a tela
Definir_arquivos
;;
*)
clear #limpa a tela
echo "Opcao desconhecida."
read pause
menuprincipal
;;
esac
}


Definir_arquivos() { # função da opção localização arquivos
 clear # limpa tela
    echo "Qual o nome do arquivo que deseja copiar?" 
    read Nome_Arquivo #Realiza a leitura para a variavel  
    read pause #pausa o script
principal #volta para a função principal
}



2) #caso o resultado da variavel seja igual a "2", então ele fará as instruções abaixo
clear #limpa a tela
Definir_diretorios
;;
*)
clear #limpa a tela
echo "Opcao desconhecida."
read pause
menuprincipal
;;
esac
}


Definir_diretorios() { # função da opção definir diretorios
clear # limpa tela
    echo "Qual o nome do diretório que deseja copiar?"
    read Nome_Diretorio #Realiza a leitura para a variavel
    read pause #pausa o script
principal #volta para a função principal
}


3) #caso o resultado da variavel seja igual a "3", então ele fará as instruções abaixo
clear #limpa a tela
Definir_caminho
;;
*)
clear #limpa a tela
echo "Opcao desconhecida."
read pause
menuprincipal
;;
esac
}


Definir_caminho() { # função da opção definir caminho
read NomeCaminho  #Realiza a leitura para a variavel
read pause #pausa o script
principal #volta para a função principal
}

4) #caso o resultado da variavel seja igual a "4", então ele fará as instruções abaixo
clear #limpa a tela
Definir_IP_Porta
;;
*)
clear #limpa a tela
echo "Opcao desconhecida."
read pause
menuprincipal
;;
esac
}


Definir_IP_Porta() { # função da opção definir IP e Porta 
echo "Informe o IP para acesso remoto" 
    read End_Ip ##Realiza a leitura para a variavel
    echo "Informe a porta ssh?"
    read Port_ssh #Realiza a leitura para a variavel
    echo "Informar o usuario" 
    read User_Backup #Realiza a leitura para a variavel
read pause #pausa o script
principal #volta para a função principal
}
