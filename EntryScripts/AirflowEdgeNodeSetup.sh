declare SSH_USERNAME=$1
declare PYTHON_VERSION=$2
declare AIRFLOW_DATABASE=$3
declare MYSQL_SERVER_USERNAME=$4
declare MYSQL_SERVER_PASSWORD=$5
declare MYSQL_SERVER_HOSTNAME=$6
declare RABBITMQ_QUEUENAME=$7
declare RABBITMQ_VHOST=$8
declare RABBITMQ_USERNAME=$9
declare RABBITMQ_PASSWORD=${10}
declare RABBITMQ_HOSTNAME=${11}
declare AIRFLOW_SMTP_PASSWORD=${12}
declare AIRFLOW_SMTP_HOSTNAME=${13}
declare AIRFLOW_SA_EMAIL=${14}

# Setup the python environment
bash InstallAndConfigurePyEnv.sh $SSH_USERNAME $PYTHON_VERSION

# Install airflow on the python environment
bash InstallAirflowWithDependencies.sh

# Define the environment variables needed to connect with the other resources in our 
# Celery executor architecture
bash DefineAirflowEnvironmentVariables.sh $SSH_USERNAME $AIRFLOW_DATABASE $MYSQL_SERVER_USERNAME $MYSQL_SERVER_PASSWORD $MYSQL_SERVER_HOSTNAME $RABBITMQ_QUEUENAME $RABBITMQ_VHOST $RABBITMQ_USERNAME $RABBITMQ_PASSWORD $RABBITMQ_HOSTNAME $AIRFLOW_SMTP_PASSWORD $AIRFLOW_SMTP_HOSTNAME $AIRFLOW_SA_EMAIL
