# Instalação do GLPI

#### Endereço do Projeto: https://github.com/glpi-project/glpi

```
ATENÇÃO É NECESSÁRIO: DOCKER E GIT INSTALADO NA MAQUINA.

Docker: https://www.docker.com/products/docker-desktop
Git: https://git-scm.com/downloads

```

## Faça o clone do repositório e siga os procedimentos abaixo:

![Clone do Repositório](https://github.com/wrsouza/glpi/raw/master/screens/01.jpg)

---

1. No terminal dentro da pasta do projeto digite o comando abaixo:

```
docker-compose up -d
```

![docker-compose up -d](https://github.com/wrsouza/glpi/raw/master/screens/02.jpg)
![baixando as imagens docker](https://github.com/wrsouza/glpi/raw/master/screens/03.jpg)
![termino do processo de instalação](https://github.com/wrsouza/glpi/raw/master/screens/04.jpg)


---


1. Após o termino do processo de instalação acesse o endereço abaixo no navegador

```
http://localhost:8080
```
---

1. Siga o passo a passo do processo de configuração.

![inicio da configuração](https://github.com/wrsouza/glpi/raw/master/screens/05.jpg)
![aceitar os termos de uso](https://github.com/wrsouza/glpi/raw/master/screens/06.jpg)
![instalar](https://github.com/wrsouza/glpi/raw/master/screens/07.jpg)
![verificar as extensões instaladas](https://github.com/wrsouza/glpi/raw/master/screens/08.jpg)
![clicar em continuar](https://github.com/wrsouza/glpi/raw/master/screens/09.jpg)
![configuração do banco](https://github.com/wrsouza/glpi/raw/master/screens/10.jpg)
```
Servidor: mysql
Usuário: root
Senha: root

Obs: Trocar senha no docker-compose.yml
```
![selecionar banco de dados](https://github.com/wrsouza/glpi/raw/master/screens/11.jpg)
![aguardar a instalação do banco](https://github.com/wrsouza/glpi/raw/master/screens/12.jpg)
![instalação concluida](https://github.com/wrsouza/glpi/raw/master/screens/13.jpg)
![coleta de estatistica](https://github.com/wrsouza/glpi/raw/master/screens/14.jpg)
![informações adicionais](https://github.com/wrsouza/glpi/raw/master/screens/15.jpg)
![instalação finalizada](https://github.com/wrsouza/glpi/raw/master/screens/16.jpg)
![tela de login](https://github.com/wrsouza/glpi/raw/master/screens/17.jpg)

---

4. Acesse o container digitando no terminal o comando abaixo
```
docker exec -it php-node bash
```
![acesso ao container](https://github.com/wrsouza/glpi/raw/master/screens/18.jpg)

---

5. Renomeiar a pasta de instalação do projeto para "x_install"
```
mv install x_install
```
![acesso ao container](https://github.com/wrsouza/glpi/raw/master/screens/19.jpg)

---

1. Saia do container digitando no terminal o comando abaixo
```
exit
```
![sair do container](https://github.com/wrsouza/glpi/raw/master/screens/20.jpg)

---

7. Verifique o Id do Container digitando no terminal o comando abaixo
```
docker ps
```
![listar os containers](https://github.com/wrsouza/glpi/raw/master/screens/21.jpg)

---

8. Faça um commit para salvar o estado do container
```
docker commit [ID_CONTAINER] [NOME_DA_IMAGEM]
Ex: docker commit e003a0ffb0d4 php-node
```
![commit do container para a imagem](https://github.com/wrsouza/glpi/raw/master/screens/22.jpg)

---

9. Digite o comando abaixo para desmontar o container
```
docker-compose down
```
![desmontar container](https://github.com/wrsouza/glpi/raw/master/screens/23.jpg)

---

10. Digite o comando abaixo para montar o container
```
docker-compose up -d
```
![montar novamente container](https://github.com/wrsouza/glpi/raw/master/screens/24.jpg)

---

### FINALIZOU O PROCESSO DE INSTALAÇÃO

```

OBS: Verifique a porta de acesso da aplicação no docker-compose.yml

```