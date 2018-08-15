__DOCKER=$(shell which docker)

all: help

help: ##: Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build-tinkergraph: ##: Build Tinkergraph
	$(__DOCKER) build tinkergraph -t fkei/simple-gremlin-tinkergraph-server:latest

pull-tinkergraph: ##: dockerhub pull Tinkergraph
	$(__DOCKER) pull fkei/simple-gremlin-tinkergraph-server

run-tinkergraph: ##: Run Tinkergraph
	$(__DOCKER) run --rm --name=simple-gremlin-tinkergraph-server -p 8182:8182 -p 8080:8080 -p 9001:9001 -it fkei/simple-gremlin-tinkergraph-server:latest

build-neo4j: ##: Build Neo4j
	$(__DOCKER) build neo4j --build-arg SKIP_DOWNLOAD_NEO4J_GREMLIN=0 -t fkei/simple-gremlin-neo4j-server:latest

build-neo4j-skip-download-plugins: ##: Build Neo4j
	$(__DOCKER) build neo4j --build-arg SKIP_DOWNLOAD_NEO4J_GREMLIN=1 -t fkei/simple-gremlin-neo4j-server:latest

pull-neo4j: ##: dockerhub pull neo4j
	$(__DOCKER) pull fkei/simple-gremlin-neo4j-server

run-neo4j: ##: Run Neo4j
	$(__DOCKER) run --rm --name=simple-gremlin-neo4j-server -v $$PWD/data:/tmp/neo4j -p 8182:8182 -p 8080:8080 -p 9001:9001 -it fkei/simple-gremlin-neo4j-server:latest

.PHONY:
	all help build-tinkergraph run-tinkergraph build-neo4j run-neo4j