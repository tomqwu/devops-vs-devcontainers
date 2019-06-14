# devops-vs-devcontainers
DevOps Visual Code devcontainers

# Add visualcode config
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

# More info
https://code.visualstudio.com/docs/remote/containers
