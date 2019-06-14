# Prerequisite
Currently, the Windows 7 Docker Toolbox is not supported due to it's using Linux kernel from VirtualBox and file share issue 

# devops-vs-devcontainers
DevOps Visual Code devcontainers

# Add Visual Studio Code config
create `.devcontainer/devcontainer.json` in the root of the repo
```
{
	"name": "devops",
	"image": "tomqwu/devops-vs-devcontainers:1.3",
	"postCreateCommand": "uname -a",
	"extensions": [
		"ms-azuretools.vscode-azureterraform",
		"mauve.terraform"
	],
	"runArgs": [
		"-v",
		"~/.aws:/root/.aws",
	]
}
```

# Available docker tags to use
1. Base - https://hub.docker.com/r/tomqwu/devops-vs-devcontainers-base/tags
1. DevOps - https://hub.docker.com/r/tomqwu/devops-vs-devcontainers/tags


# More info
https://code.visualstudio.com/docs/remote/containers
