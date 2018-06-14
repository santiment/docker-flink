FROM flink:1.4.2-scala_2.11

# Environment is inherited from the parent image
# FLINK_VERSION=1.4.2
# FLINK_HOME=/opt/flink
# WORKDIR $FLINK_HOME

RUN cp $FLINK_HOME/opt/flink-s3-fs-hadoop-$FLINK_VERSION.jar \
       $FLINK_HOME/opt/flink-cep_2.11-$FLINK_VERSION.jar \
       $FLINK_HOME/opt/flink-cep-scala_2.11-$FLINK_VERSION.jar \
       $FLINK_HOME/opt/flink-queryable-state-runtime_2.11-$FLINK_VERSION.jar \
       $FLINK_HOME/opt/flink-metrics-prometheus-$FLINK_VERSION.jar \
       $FLINK_HOME/lib 

COPY 1.4/lib/* lib/
