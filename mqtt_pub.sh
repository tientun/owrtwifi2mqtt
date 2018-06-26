#!/bin/sh
MQTT_SERVER=
MQTT_PORT=1883
MQTT_TOPIC="network/router/wifi"
MQTT_USERNAME=""
MQTT_PASSWORD=""

json="{\"status\": \"$3\", \"mac\": \"$2\", \"interface\": \"$1\"}"
echo $json
mosquitto_pub -h $MQTT_SERVER -p $MQTT_PORT -t $MQTT_TOPIC -u $MQTT_USERNAME -P $MQTT_PASSWORD -m "$json"


if [[ $3 == "new" ]]
then
  echo "someone has connected with mac id $2 on $1"
fi

if [[ $3 == "del" ]]
then
  echo "someone has disconnected with mac id $2 on $1"
fi