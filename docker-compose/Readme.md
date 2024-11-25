# Deployment with Docker Compose

### Docker Compose
Starwit's AI Cockpit can be started such, that sample configuration and data are imported upon first launch. This docker compose script aims at using this capability. In folder [scenariodata](scenariodata/) a growing set of sample data can be found. This allows to test AI Cockpit with various sample configurations.

Sample data set can be configured via environment parameters or via [.env](./.env) file. That configured, you can start all necessary components like so:

```bash
    cd docker-compose
    sudo docker compose -f import-demo-docker-compose.yml up
```