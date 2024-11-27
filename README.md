# AI Cockpit deployment

This repository contains tools to deploy all components of AI Cockpit. 

## Deployment

Components can be deployed with two tools: Docker Compose and Helmfile. Docker Compose runs all components as Docker images and with Helmfile all components are deployed to a Kubernetes cluster.

The following diagram shows an overview of software components as well as a number of versioned artifacts.

![](doc/DeploymentConcept.drawio.svg)

### Docker Compose

```bash
    cd docker-compose
    sudo docker compose -f docker-compose.yaml up
```

### Helmfile

#### Establish Environment

* get secrets from bitwarden:
   * get ssh public and private key
   * get kubeconfig
   * use env-template.sh and create env.sh and add it as source in your console
* use port forwarding to get connection to cluster, e.g.: `ssh -L 16443:localhost:6443 ai-cockpit`
* check that port forwarding is running e.g. with `kubectl get all --all-namespaces`

#### Execute

With Helmfile you need a running Kubernetes cluster and your KUBECONFIG variable needs to point to an according config. If this is the case, the following command will install all components to namespace _aic_.
```bash
    cd helmfile
    helmfile diff helmfile.yaml -e aic-dev # check planned changes
    helmfile apply helmfile.yaml -e aic-dev 
```

#### Connection to Database

* start pgadmin e.g. via docker compose script in your deployment project and add db connection:
    * get postgres credentials from kubernetes secrets
    * use port forwarding with ip 0.0.0.0 (e.g. via k9s) to be able to reach postgres port

## Component Breakdown
The components of Starwit's implementation of AI cockpit can be found in the following repositories:

| Component       | Repository / URI                                       | Description |
| ----------------| -------------------------------------------------------| ----------- |
| AI Cockpit      |https://github.com/starwit/ai-cockpit                   | Acutal Cockpit|
| Transparency API|https://github.com/starwit/starwit-aic-transparency-api | API for transparency functions|
| Decision API    |https://github.com/starwit/starwit-aic-decision-api     | API for decision/control interface |

For more details about AI Cockpit visit project page: https://www.kicockpit.eu/