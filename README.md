## Sinopia (Docker Image)

> [Sinopia](https://github.com/rlidwka/sinopia) is a private npm repository server.

**Notice**
> Major update for stability  - currently using the orignal, [unmodified repo](https://github.com/rlidwka/sinopia) and [node v0.10](https://nodejs.org/docs/latest-v0.10.x/api/). The file structure has been modified - the sinopia repo is located at /sinopia/registry. The hotfix for easily using a proxy isn't in the main source (I'll build a new version tagged proxy with my fork).  Eventually this version will be only tagged as stable. See [this issue](https://github.com/rlidwka/sinopia/issues/376) for speculation on the future of sinopia.

### Recommend Usage

- To run default container on port 4873

`docker run --name sinopia -d -p 4873:4873 rnbwd/sinopia`

`docker run --name sinopia -d -p 4873:4873 -v <local-path-to-storage>:/sinopia/registry/storage -v <local-path-to-config>:/sinopia/registry/config.yaml rnbwd/sinopia`

- The volume will be synced, so you can update the anything linked outside of the container and it will automatically change the files inside the container. Run `docker restart sinopia` if `config.yaml` is updated.
wd/sinopia`

### Building Custom Containers

- From github repository

```
git clone https://github.com/RnbWd/sinopia-docker.git
cd sinopia-docker
docker build -t sinopia .
docker run -d -p 4873:4873 sinopia
```

## License

MIT
