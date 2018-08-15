# simple-gremlin-server
Gremlin Server (Tinkergraph/Neo4J) for Docker

# Included products

- Tinkerpop3 / Gremlin Server / Tinkergraph [http://tinkerpop.apache.org/](http://tinkerpop.apache.org/)
- Neo4j [https://neo4j.com/](https://neo4j.com/)
- graphexp [https://github.com/bricaud/graphexp](https://github.com/bricaud/graphexp)
- supervisor [http://supervisord.org/](http://supervisord.org/)

# Pre

Docker needs to be running.

# QuickStart - in-memory(tinkergraph)

Pull image from docker.io [https://hub.docker.com/r/fkei/simple-gremlin-tinkergraph-server/](https://hub.docker.com/r/fkei/simple-gremlin-tinkergraph-server/)

```
make pull-tinkergraph
```

docker run

```
make run-tinkergraph
```

# QuickStart - disk(neo4j)

Pull image from docker.io [https://hub.docker.com/r/fkei/simple-gremlin-neo4j-server/](https://hub.docker.com/r/fkei/simple-gremlin-neo4j-server/)

```
make pull-neo4j
```

docker run

```
make run-neo4j
```

# Access

HTTP or WebSocket (Gremlin Server)

`PORT: 8182`

[http://localhost:8182/gremlin](http://localhost:8182/gremlin)

> access ex. `curl -X POST -d "{\"gremlin\": \"g.V()\"}" http://localhost:8182/gremlin | jq "."`

Web UI - Visualize tool (graphexp)

`PORT: 8080`

[http://localhost:8080/](http://localhost:8080/)

Web UI - Process Manager (supervisor)

`PORT: 9001`

[http://localhost:9001/](http://localhost:9001/)


# docker build (developer)

tinkergraph

```
make build-tinkergraph
```

Neo4j

```
make build-neo4j
```