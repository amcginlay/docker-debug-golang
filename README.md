# Debugging Golang via Docker

## Bookmarks
- [Golang: Debug Docker & Kubernetes containers](https://www.youtube.com/watch?v=zs3XQMTHQBE)
- [Docker Compose to Docker Run Converter](https://ray.run/tools/docker-compose-to-docker-run)
- [Docker Run to Docker Compose Converter](https://ray.run/tools/docker-run-to-docker-compose)

## These instructions assume following
- Docker Engine and associated tools (e.g. docker and docker-compose) are present.
- VSCode is the development IDE in use.
- [Microsoft's Docker Extension](https://github.com/microsoft/vscode-docker) for VSCode is installed
- Ports 8080 and 4000 on the local machine and not currently in use

## Steps to demo debugging in docker-based Golang installation
- Clone this repo
- Open VSCode against this cloned folder
- In the VSCode terminal, run `docker-compose --build up debug-server`
- `curl localhost:80/hello` to test server is running
- To attach the debugger to the running process:
  - Select the "Run And Debug" panel in VSCode
  - Select "Docker: Attach to Golang" from the dropdown (NOTE: this is defined in the `.vscode/launch.json` file)
  - Hit the green "Play" button to attach the debugger
  - Check the Debug Console window to confirm successful attachment
- To debug the code:
  - Open `src/main.go` in the editor and click in the margin of the line which reads `fmt.Println("/hello endpoint called")` to place a red breakpoint on it.
  - `curl localhost:8080/hello` again to step into the `main.go` code
