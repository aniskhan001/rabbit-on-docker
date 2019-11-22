set -e

#############
### SETUP ###
#############

helpFunc()
{
   echo ""
   echo "Usage: $0 -v vhost_name"
   echo "\t-v Name of vhost"
   exit 1 # Exit script after printing help
}

while getopts "v:" opt
do
   case "$opt" in
      v ) parameterV="$OPTARG" ;;
      ? ) helpFunc ;; # Print helpFunc in case parameter is non-existent
   esac
done

# print helpFunc if vhost not provided
if [ -z "$parameterV" ]
then
   echo "vhost not provided";
   helpFunc
fi

# Begin script in case all parameters are correct
echo "supplied vhost name: $parameterV"


##############
### ACTION ###
##############

# replace vhost in the template
sed "s/THE_NAME_OF_VHOST/${parameterV}/g" rabbit-config-template.json > rabbit-config.json
sed "s/THE_NAME_OF_VHOST/${parameterV}/g" vhost-template.env > vhost.env

# boot up the RabbitMQ instance
docker-compose up -d
