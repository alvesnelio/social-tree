SHELL := /bin/bash

export
# CONFIGURAÇÃO DAS VARIÁVEIS DO TERMINAL.

# APLICAÇÃO
APLICATION_NAME="social tree"
APLICATION_SERVICE=node

# CORES
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
WHITE=`tput setaf 7`
RESET=`tput sgr0`

export HOST_UID:=$(shell id --user)
export HOST_USER:=$(shell id --user --name)
export HOST_GID:=$(shell id --group)
export HOST_GROUP:=$(shell id --group --name)

.PHONY: help build up deploy console refresh scssToCss

help:
	@echo ${GREEN} 'Lista de comandos disponíveis no "make"'
	@echo ''
	@echo ${YELLOW} 'Opções: make [TARGET] [OPTIONS]'
	@echo ''
	@echo ${BLUE} 'help' ${RESET} 'Mostra esta mensagem'
	@echo ''
	@echo ${BLUE} 'build' ${RESET} 'Compila os assets e levanta o servidor Node $(APLICATION_NAME)'
	@echo ''
	@echo ${BLUE} 'up' ${RESET} 'Levanta o servidor node $(APLICATION_NAME)'
	@echo ''
	@echo ${BLUE} 'deploy' ${RESET} 'Compila os assets do projeto $(APLICATION_NAME)'
	@echo ''
	@echo ${BLUE} 'refresh' ${RESET} 'Atualiza os assets e limpa o cache do projeto $(APLICATION_NAME)'
	@echo ''
	@echo ${BLUE} 'scssToCss' ${RESET} 'Converter arquivos scss para css do projeto $(APLICATION_NAME)'
	@echo ''
	@echo ''

build:
	@echo 'Instalando o projeto $(APLICATION_NAME)'
	$(MAKE) deploy
	$(MAKE) up

up:
	@echo 'Buildando o projeto $(APLICATION_NAME)'.
	@node server.js

deploy:
	@echo 'Deployando o projeto $(APLICATION_NAME)'.
	@npm install -y
	@echo ''
	$(MAKE) scssToCss

refresh:
	@npm install -y

scssToCss:
	@echo "${RESET}Executando a geração dos css ${GREEN} 'scssToCss' do projeto ${APLICATION_NAME}${RESET}."
	@npm run scssToCss;