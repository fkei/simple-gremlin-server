# simple-gremlin-server
Gremlin Server (Tinkergraph/Neo4J) for Docker

# Included products

- Tinkerpop3 / Gremlin Server
- Tinkergraph
- Neo4j
- graphexp
- supervisor

# Pre

Docker needs to be running.

# QuickStart - in-memory

Pull image from docker.io

```
make pull-tinkergraph
```

docker run

```
make run-tinkergraph
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