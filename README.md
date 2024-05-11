# AI Cockpit deployment

This repository contains tools to deploy all components of AI Cockpit. 

## Deployment

Components can be deployed with two tools: Docker Compose and Helmfile. Docker Compose runs all components as Docker images and with Helmfile all components are deployed to a Kubernetes cluster.

### Docker Compose

```bash
    cd docker-compose
    sudo docker compose -f docker-compose.yaml up
```

### Helmfile
With Helmfile you need a running Kubernetes cluster and your KUBECONFIG variable needs to point to an according config. If this is the case, the following command will install all components to namespace _aic_.
```bash
    cd helmfile
    helmfile diff helmfile.yaml # check planned changes
    helmfile apply helmfile.yaml
```

## Component Breakdown
The components of Starwit's implementation of AI cockpit can be found in the following repositories:

| Component       | Repository / URI                                       | Description |
| ----------------| -------------------------------------------------------| ----------- |
| AI Cockpit      |https://github.com/starwit/ai-cockpit                   | Acutal Cockpit|
| Transparency API|https://github.com/starwit/starwit-aic-transparency-api | API for transparency functions|
| Decision API    |https://github.com/starwit/starwit-aic-decision-api     | API for decision/control interface |

For more details about AI Cockpit visit project page: https://www.kicockpit.eu/