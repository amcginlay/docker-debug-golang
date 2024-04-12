# Debugging Golang via Docker and VSCode

## Bookmarks
- [Golang: Debug Docker & Kubernetes containers](https://www.youtube.com/watch?v=zs3XQMTHQBE)
- [Debugging a Go Application Inside Docker Using VSCode](https://dev.to/bruc3mackenzi3/debugging-go-inside-docker-using-vscode-4f67)
- [Docker Compose to Docker Run Converter](https://ray.run/tools/docker-compose-to-docker-run)
- [Docker Run to Docker Compose Converter](https://ray.run/tools/docker-run-to-docker-compose)

## These instructions assume following
- Docker Engine and associated tools (e.g. docker and docker-compose) are present.
- VSCode is the development IDE in use.
- [Microsoft's Docker Extension](https://github.com/microsoft/vscode-docker) for VSCode is installed
- Ports 8080 and 4000 on the local machine and not currently in use
- Next steps? [Getting started with vim Go](https://www.youtube.com/watch?v=7zCCnT9a58k&list=WL&index=1&t=83s)

## Steps to demo debugging in docker-based Golang application
- Clone this repo
- Open VSCode against this cloned folder
- In the VSCode terminal, run `docker-compose up debug`
- `curl localhost:8080/hello` to test server is running
- To attach the debugger to the running process:
  - Select the "Run And Debug" panel in VSCode
  - Select "Docker: Attach to Golang" from the dropdown (NOTE: this is defined in the `.vscode/launch.json` file)
  - Hit the green "Play" button to attach the debugger
  - Check the Debug Console window to confirm successful attachment
- To debug the code:
  - Open `src/main.go` in the editor and click in the margin of the line which reads `fmt.Println("/hello endpoint called")` to place a red breakpoint on it.
  - `curl localhost:8080/hello` again to step into the `main.go` code
