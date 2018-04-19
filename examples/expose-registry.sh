# Expose insecure registry
oc create route edge --service docker-registry -n default

# Log in as sys admin
oc login -u system:admin

# Add system:registry role
oc adm policy add-role-to-user system:registry developer

# Add admin role for the project associated with the Docker operation. 
oc adm policy add-role-to-user admin developer -n <project>

# Add system:image-builder role
oc adm policy add-role-to-user system:image-builder developer

# Log in as developer
oc login

# Log in to the Docker registry
docker login -u developer -e unused -p $(oc whoami -t) $(oc get route docker-registry -n default --template='{{ .spec.host }}')

# Create passthrough route
oc create route passthrough --service registry-console --port registry-console -n default

# Deploy the registry console
oc new-app -n default --template=registry-console \
    -p OPENSHIFT_OAUTH_PROVIDER_URL="https://192.168.42.77:8443" \
    -p REGISTRY_HOST=$(oc get route docker-registry -n default --template='{{ .spec.host }}') \
    -p COCKPIT_KUBE_URL=$(oc get route registry-console -n default --template='https://{{ .spec.host }}')
