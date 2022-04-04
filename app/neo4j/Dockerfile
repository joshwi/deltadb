FROM neo4j:4.4.5
ARG NEO4J_PASSWORD
ENV NEO4J_AUTH=neo4j/${NEO4J_PASSWORD}
RUN chown -R neo4j:neo4j import
RUN chown -R neo4j:neo4j data
RUN chown -R neo4j:neo4j logs
COPY neo4j.conf conf/neo4j.conf
RUN chmod -R 777 conf/neo4j.conf
COPY apoc-4.4.0.1-all.jar plugins/apoc-4.4.0.1-all.jar
RUN chmod -R 755 plugins/apoc-4.4.0.1-all.jar
USER neo4j