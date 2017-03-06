
host=http://admin:admin@192.168.33.39:8080
url=/pluginManager/installNecessaryPlugins
jenkins_create_job_url=/createItem?name=rest_api
jenkins_trigger_job=/job/rest_api/build?token=ceYJFz2kHxV9

#git plugin
curl -X POST -d '<jenkins><install plugin="git@3.0.5" /></jenkins>' --header 'Content-Type: text/xml' $host$url

#docker plugins
curl -X POST -d '<jenkins><install plugin="docker-plugin@0.16.2" /></jenkins>' --header 'Content-Type: text/xml' $host$url
curl -X POST -d '<jenkins><install plugin="docker-build-publish@1.3.2" /></jenkins>' --header 'Content-Type: text/xml' $host$url
curl -X POST -d '<jenkins><install plugin="docker-build-step@1.39" /></jenkins>' --header 'Content-Type: text/xml' $host$url

#jenkins job creation
curl -XPOST $host$jenkins_create_job_url --data-binary @/vagrant/provisioning/vars/config.xml -H "Content-Type:text/xml"

# jenkins safe restart to enable plugins
sleep 120
curl -X POST $host/safeRestart

# wait for jenkins restart and trigger job
sleep 120
echo "triggering jenkins job"
curl -X POST $host$jenkins_trigger_job
