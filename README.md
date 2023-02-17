# [SJI's](https://stjamesinfirmary.org) Bad Date List Deployment [IaC](https://en.wikipedia.org/wiki/Infrastructure_as_code)

This repository contains a docker compose file that can be used for deploying the SJI SF BDL.  This deployment consists of 3 container's: a mongodb database container, a node container for the react frontend, and another node container for the nodejs backend.  It is expected that the deployment settings will be saved in a .env file and that the dployment will be started with `docker-compose up`.
