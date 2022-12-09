# gardenlinux-repo-manager
## General
Supported repositories for packages in Garden Linux are managed by the `garden-repo-manager` cli tool. It allows to define the Garden Linux (default) repository as well as additional Debian ones. It allows to obtain software from `testing`, `unstable` and `experimental` suites as well as all components (e.g. `main`, `contrib`, `non-free`,...).

## Usage
The `garden-repo-manager` tool provides mainly the three commands `add`, `remove` and `list` for adding, removing and listing repositories followed by the desired Linux distribution (e.g. Garden Linux or Debian) and the suites/components.

For each created suite (e.g. `testing`, `unstable`) a repository file will be written to `/etc/apt/sources.list.d/` in a `Deb822-style` compatible file. The file name will contain the distribution and suite.

For an added Debian testing repository the created filename would be generated as:
```
garden_repo_manager_debian_testing.sources
```


### Garden Linux
By default, the Garden Linux repository is added in all Garden Linux artifacts. However, it can be removed and added if needed. Make sure that the GPG repository key file `/etc/apt/trusted.gpg.d/gardenlinux.asc` exists.

#### Adding
Adding the Garden Linux repository does not require any further parameters:
```
garden-repo-manager add gardenlinux
```

#### Removing
Removing the Garden Linux repository does not require any further parameters:
```
garden-repo-manager remove gardenlinux
```

#### Repository URL
The following repository URLs are available for Garden Linux:

| Type | URL |
| -- | -- |
| default | https://repo.gardenlinux.io/gardenlinux |
| snapshot | https://repo.gardenlinux.io/gardenlinux/dists/$timestamp |

Hint: The timestamp value is represented by the version.<br>Example:

`http://repo.gardenlinux.io/gardenlinux/dists/934.1/`

### Debian repository
Additional Debian repositories can be added for Garden Linux to benefit from further software packages in different options. This can become very handy when a newer software version from `unstable` or `experimental` is needed.

Currently, the `testing`, `unstable` and `experimental` suites are supported.

#### Adding
Adding a Debian repository needs a desired suite and components parameters:
```
garden-repo-manager add debian testing -c main contrib
```

#### Removing
Removing a Debian repository needs a desired suite and components parameters:
```
garden-repo-manager remove debian testing -c main contrib
```

#### Repository URL
The following repository URLs are available for Debian:

| Type | URL |
| -- | -- |
| default | https://deb.debian.org/debian |
| snapshot | https://snapshot.debian.org/archive/debian/$timestamp |

#### List
All in DEB822 format managed and unmanaged repositories can be listed by running:
```
garden-repo-manager list
```

### Optional options
`garden-repo-manager` optionally allows further parameters. Therefore, source repositories or additional architectures may be set.

| Parameter short | Parameter long | Description |
| -- | -- | -- |
| -a | --arch | Set a desired hardware architecture for the repository (e.g. cross-compile) |
| -c | --components | Defines the components for a distribution. |
| -p | --packages | Path to local packages (needs a repository index file) |
| -s | --source | Add repository as sources |
| -t | --timestamp | Defines a timestamp or version for a repository and sets the repository URI according the snapshot archives |


## Bugs
Bugs and issus may be reported to the Garden Linux Github project: https://github.com/gardenlinux/gardenlinux/issues