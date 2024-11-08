module completions {

  def "nu-complete uv python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv color" [] {
    [ "auto" "always" "never" ]
  }

  # An extremely fast Python package manager.
  export extern uv [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv run index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv run keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv run resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv run prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv run link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv run python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv run python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv run color" [] {
    [ "auto" "always" "never" ]
  }

  # Run a command or script
  export extern "uv run" [
    --extra: string           # Include optional dependencies from the extra group name
    --all-extras              # Include all optional dependencies
    --no-all-extras
    --dev                     # Include development dependencies
    --no-dev                  # Omit development dependencies
    --with: string            # Run with the given packages installed
    --with-editable: string   # Run with the given packages installed as editables
    --with-requirements: string # Run with all packages listed in the given `requirements.txt` files
    --isolated                # Run the command in an isolated virtual environment
    --no-sync                 # Avoid syncing the virtual environment
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Run without updating the `uv.lock` file
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv run index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv run keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv run resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv run prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv run link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --package: string         # Run the command in a specific package in the workspace
    --no-project              # Avoid discovering the project or workspace
    --python(-p): string      # The Python interpreter to use for the run environment.
    --show-resolution         # Whether to show resolver and installer output from any environment modifications
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv run python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv run python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv run color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv init python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv init python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv init color" [] {
    [ "auto" "always" "never" ]
  }

  # Create a new project
  export extern "uv init" [
    path?: string             # The path to use for the project
    --name: string            # The name of the project
    --virtual                 # Create a virtual project, rather than a package
    --package                 # Set up the project to be built as a Python package
    --no-package              # Do not set up the project to be built as a Python package
    --app                     # Create a project for an application
    --lib                     # Create a project for a library
    --no-readme               # Do not create a `README.md` file
    --no-pin-python           # Do not create a `.python-version` file for the project
    --no-workspace            # Avoid discovering a workspace and create a standalone project
    --python(-p): string      # The Python interpreter to use to determine the minimum supported Python version.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv init python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv init python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv init color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv add index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv add keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv add resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv add prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv add link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv add python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv add python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv add color" [] {
    [ "auto" "always" "never" ]
  }

  # Add dependencies to the project
  export extern "uv add" [
    ...packages: string       # The packages to add, as PEP 508 requirements (e.g., `ruff==0.5.0`)
    --requirements(-r): string # Add all packages listed in the given `requirements.txt` files
    --dev                     # Add the requirements as development dependencies
    --optional: string        # Add the requirements to the specified optional dependency group
    --editable                # Add the requirements as editable
    --no-editable
    --raw-sources             # Add source requirements to `project.dependencies`, rather than `tool.uv.sources`
    --rev: string             # Commit to use when adding a dependency from Git
    --tag: string             # Tag to use when adding a dependency from Git
    --branch: string          # Branch to use when adding a dependency from Git
    --extra: string           # Extras to enable for the dependency
    --no-sync                 # Avoid syncing the virtual environment
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Add dependencies without re-locking the project
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv add index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv add keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv add resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv add prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv add link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --package: string         # Add the dependency to a specific package in the workspace
    --script: string          # Add the dependency to the specified Python script, rather than to a project
    --python(-p): string      # The Python interpreter to use for resolving and syncing.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv add python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv add python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv add color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv remove index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv remove keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv remove resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv remove prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv remove link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv remove python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv remove python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv remove color" [] {
    [ "auto" "always" "never" ]
  }

  # Remove dependencies from the project
  export extern "uv remove" [
    ...packages: string       # The names of the dependencies to remove (e.g., `ruff`)
    --dev                     # Remove the packages from the development dependencies
    --optional: string        # Remove the packages from the specified optional dependency group
    --no-sync                 # Avoid syncing the virtual environment after re-locking the project
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Remove dependencies without re-locking the project
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv remove index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv remove keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv remove resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv remove prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv remove link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --package: string         # Remove the dependencies from a specific package in the workspace
    --script: string          # Remove the dependency from the specified Python script, rather than from a project
    --python(-p): string      # The Python interpreter to use for resolving and syncing.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv remove python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv remove python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv remove color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv sync index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv sync keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv sync resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv sync prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv sync link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv sync python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv sync python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv sync color" [] {
    [ "auto" "always" "never" ]
  }

  # Update the project's environment
  export extern "uv sync" [
    --extra: string           # Include optional dependencies from the extra group name
    --all-extras              # Include all optional dependencies
    --no-all-extras
    --dev                     # Include development dependencies
    --no-dev                  # Omit development dependencies
    --inexact                 # Do not remove extraneous packages present in the environment
    --exact                   # Perform an exact sync, removing extraneous packages
    --no-install-project      # Do not install the current project
    --no-install-workspace    # Do not install any workspace members, including the root project
    --no-install-package: string # Do not install the given package(s)
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Sync without updating the `uv.lock` file
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv sync index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv sync keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv sync resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv sync prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv sync link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --package: string         # Sync for a specific package in the workspace
    --python(-p): string      # The Python interpreter to use for the project environment.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv sync python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv sync python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv sync color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv lock index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv lock keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv lock resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv lock prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv lock link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv lock python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv lock python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv lock color" [] {
    [ "auto" "always" "never" ]
  }

  # Update the project's lockfile
  export extern "uv lock" [
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Assert that a `uv.lock` exists, without updating it
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv lock index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv lock keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv lock resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv lock prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv lock link_mode" # The method to use when installing packages from the global cache
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --python(-p): string      # The Python interpreter to use during resolution.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv lock python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv lock python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv lock color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv export format" [] {
    [ "requirements-txt" ]
  }

  def "nu-complete uv export index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv export keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv export resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv export prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv export link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv export python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv export python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv export color" [] {
    [ "auto" "always" "never" ]
  }

  # Export the project's lockfile to an alternate format
  export extern "uv export" [
    --format: string@"nu-complete uv export format" # The format to which `uv.lock` should be exported
    --package: string         # Export the dependencies for a specific package in the workspace
    --extra: string           # Include optional dependencies from the extra group name
    --all-extras              # Include all optional dependencies
    --no-all-extras
    --dev                     # Include development dependencies
    --no-dev                  # Omit development dependencies
    --hashes                  # Include hashes for all dependencies
    --no-hashes               # Omit hashes in the generated output
    --output-file(-o): string # Write the exported requirements to the given file
    --no-emit-project         # Do not emit the current project
    --no-emit-workspace       # Do not emit any workspace members, including the root project
    --no-emit-package: string # Do not emit the given package(s)
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Do not update the `uv.lock` before exporting
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv export index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv export keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv export resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv export prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv export link_mode" # The method to use when installing packages from the global cache
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --python(-p): string      # The Python interpreter to use during resolution.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv export python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv export python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv export color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tree index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv tree keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv tree resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv tree prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv tree link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv tree python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" ]
  }

  def "nu-complete uv tree python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tree python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tree color" [] {
    [ "auto" "always" "never" ]
  }

  # Display the project's dependency tree
  export extern "uv tree" [
    --universal               # Show a platform-independent dependency tree
    --depth(-d): string       # Maximum display depth of the dependency tree
    --prune: string           # Prune the given package from the display of the dependency tree
    --package: string         # Display only the specified packages
    --no-dedupe               # Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated
    --invert                  # Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package
    --locked                  # Assert that the `uv.lock` will remain unchanged
    --frozen                  # Display the requirements without locking the project
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv tree index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv tree keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv tree resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv tree prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv tree link_mode" # The method to use when installing packages from the global cache
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --python-version: string  # The Python version to use when filtering the tree
    --python-platform: string@"nu-complete uv tree python_platform" # The platform to use when filtering the tree
    --python(-p): string      # The Python interpreter to use for locking and filtering.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tree python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tree python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tree color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool color" [] {
    [ "auto" "always" "never" ]
  }

  # Run and install commands provided by Python packages
  export extern "uv tool" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool run index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv tool run keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv tool run resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv tool run prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv tool run link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv tool run python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool run python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool run color" [] {
    [ "auto" "always" "never" ]
  }

  # Run a command provided by a Python package
  export extern "uv tool run" [
    --from: string            # Use the given package to provide the command
    --with: string            # Run with the given packages installed
    --with-requirements: string # Run with all packages listed in the given `requirements.txt` files
    --isolated                # Run the tool in an isolated virtual environment, ignoring any already-installed tools
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv tool run index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv tool run keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv tool run resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv tool run prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv tool run link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --python(-p): string      # The Python interpreter to use to build the run environment.
    --show-resolution         # Whether to show resolver and installer output from any environment modifications
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool run python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool run python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool run color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool uvx index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv tool uvx keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv tool uvx resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv tool uvx prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv tool uvx link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv tool uvx python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool uvx python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool uvx color" [] {
    [ "auto" "always" "never" ]
  }

  # Run a command provided by a Python package.
  export extern "uv tool uvx" [
    --from: string            # Use the given package to provide the command
    --with: string            # Run with the given packages installed
    --with-requirements: string # Run with all packages listed in the given `requirements.txt` files
    --isolated                # Run the tool in an isolated virtual environment, ignoring any already-installed tools
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv tool uvx index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv tool uvx keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv tool uvx resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv tool uvx prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv tool uvx link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --python(-p): string      # The Python interpreter to use to build the run environment.
    --show-resolution         # Whether to show resolver and installer output from any environment modifications
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool uvx python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool uvx python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool uvx color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool install index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv tool install keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv tool install resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv tool install prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv tool install link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv tool install python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool install python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool install color" [] {
    [ "auto" "always" "never" ]
  }

  # Install commands provided by a Python package
  export extern "uv tool install" [
    package: string           # The package to install commands from
    --editable(-e)
    --from: string            # The package to install commands from
    --with: string            # Include the following extra requirements
    --with-requirements: string # Run all requirements listed in the given `requirements.txt` files
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv tool install index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv tool install keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv tool install resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv tool install prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv tool install link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --force                   # Force installation of the tool
    --python(-p): string      # The Python interpreter to use to build the tool environment.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool install python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool install python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool install color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool upgrade index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv tool upgrade keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv tool upgrade resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv tool upgrade prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv tool upgrade link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv tool upgrade python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool upgrade python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool upgrade color" [] {
    [ "auto" "always" "never" ]
  }

  # Upgrade installed tools
  export extern "uv tool upgrade" [
    ...name: string           # The name of the tool to upgrade
    --all                     # Upgrade all tools
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv tool upgrade index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv tool upgrade keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv tool upgrade resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv tool upgrade prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv tool upgrade link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool upgrade python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool upgrade python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool upgrade color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool list python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool list python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool list color" [] {
    [ "auto" "always" "never" ]
  }

  # List installed tools
  export extern "uv tool list" [
    --show-paths              # Whether to display the path to each tool environment and installed executable
    --show-version-specifiers # Whether to display the version specifier(s) used to install each tool
    --python-preference: string@"nu-complete uv tool list python_preference"
    --no-python-downloads
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --python-fetch: string@"nu-complete uv tool list python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool list color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool uninstall python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool uninstall python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool uninstall color" [] {
    [ "auto" "always" "never" ]
  }

  # Uninstall a tool
  export extern "uv tool uninstall" [
    ...name: string           # The name of the tool to uninstall
    --all                     # Uninstall all tools
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool uninstall python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool uninstall python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool uninstall color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool update-shell python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool update-shell python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool update-shell color" [] {
    [ "auto" "always" "never" ]
  }

  # Ensure that the tool executable directory is on the `PATH`
  export extern "uv tool update-shell" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool update-shell python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool update-shell python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool update-shell color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv tool dir python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv tool dir python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv tool dir color" [] {
    [ "auto" "always" "never" ]
  }

  # Show the path to the uv tools directory
  export extern "uv tool dir" [
    --bin                     # Show the directory into which `uv tool` will install executables.
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv tool dir python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv tool dir python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv tool dir color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python color" [] {
    [ "auto" "always" "never" ]
  }

  # Manage Python versions and installations
  export extern "uv python" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python list python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python list python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python list color" [] {
    [ "auto" "always" "never" ]
  }

  # List the available Python installations
  export extern "uv python list" [
    --all-versions            # List all Python versions, including old patch versions
    --all-platforms           # List Python downloads for all platforms
    --only-installed          # Only show installed Python versions, exclude available downloads
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python list python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python list python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python list color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python install python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python install python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python install color" [] {
    [ "auto" "always" "never" ]
  }

  # Download and install Python versions
  export extern "uv python install" [
    ...targets: string        # The Python version(s) to install
    --reinstall(-r)           # Reinstall the requested Python version, if it's already installed
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python install python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python install python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python install color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python find python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python find python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python find color" [] {
    [ "auto" "always" "never" ]
  }

  # Search for a Python installation
  export extern "uv python find" [
    request?: string          # The Python request
    --no-project              # Avoid discovering a project or workspace
    --system                  # Only find system Python interpreters
    --no-system
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python find python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python find python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python find color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python pin python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python pin python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python pin color" [] {
    [ "auto" "always" "never" ]
  }

  # Pin to a specific Python version
  export extern "uv python pin" [
    request?: string          # The Python version request
    --resolved                # Write the resolved Python interpreter path instead of the request
    --no-resolved
    --no-project              # Avoid validating the Python pin is compatible with the project or workspace
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python pin python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python pin python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python pin color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python dir python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python dir python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python dir color" [] {
    [ "auto" "always" "never" ]
  }

  # Show the uv Python installation directory
  export extern "uv python dir" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python dir python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python dir python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python dir color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv python uninstall python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv python uninstall python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv python uninstall color" [] {
    [ "auto" "always" "never" ]
  }

  # Uninstall Python versions
  export extern "uv python uninstall" [
    ...targets: string        # The Python version(s) to uninstall
    --all                     # Uninstall all managed Python versions
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv python uninstall python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv python uninstall python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv python uninstall color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip color" [] {
    [ "auto" "always" "never" ]
  }

  # Manage Python packages with a pip-compatible interface
  export extern "uv pip" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip compile index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv pip compile keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv pip compile resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv pip compile prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv pip compile link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv pip compile annotation_style" [] {
    [ "line" "split" ]
  }

  def "nu-complete uv pip compile python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" ]
  }

  def "nu-complete uv pip compile resolver" [] {
    [ "backtracking" "legacy" ]
  }

  def "nu-complete uv pip compile python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip compile python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip compile color" [] {
    [ "auto" "always" "never" ]
  }

  # Compile a `requirements.in` file to a `requirements.txt` file
  export extern "uv pip compile" [
    ...src_file: string       # Include all packages listed in the given `requirements.in` files
    --constraint(-c): string  # Constrain versions using the given requirements files
    --override: string        # Override versions using the given requirements files
    --build-constraint(-b): string # Constrain build dependencies using the given requirements files when building source distributions
    --extra: string           # Include optional dependencies from the extra group name; may be provided more than once
    --all-extras              # Include all optional dependencies
    --no-all-extras
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv pip compile index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv pip compile keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv pip compile resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv pip compile prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv pip compile link_mode" # The method to use when installing packages from the global cache
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --no-deps                 # Ignore package dependencies, instead only add those packages explicitly listed on the command line to the resulting the requirements file
    --deps
    --output-file(-o): string # Write the compiled requirements to the given `requirements.txt` file
    --no-strip-extras         # Include extras in the output file
    --strip-extras
    --no-strip-markers        # Include environment markers in the output file
    --strip-markers
    --no-annotate             # Exclude comment annotations indicating the source of each package
    --annotate
    --no-header               # Exclude the comment header at the top of the generated output file
    --header
    --annotation-style: string@"nu-complete uv pip compile annotation_style" # The style of the annotation comments included in the output file, used to indicate the source of each package
    --custom-compile-command: string # The header comment to include at the top of the output file generated by `uv pip compile`
    --python: string          # The Python interpreter to use during resolution.
    --system                  # Install packages into the system Python environment
    --no-system
    --generate-hashes         # Include distribution hashes in the output file
    --no-generate-hashes
    --no-build                # Don't build source distributions
    --build
    --no-binary: string       # Don't install pre-built wheels
    --only-binary: string     # Only use pre-built wheels; don't build source distributions
    --python-version(-p): string # The Python version to use for resolution
    --python-platform: string@"nu-complete uv pip compile python_platform" # The platform for which requirements should be resolved
    --universal               # Perform a universal resolution, attempting to generate a single `requirements.txt` output file that is compatible with all operating systems, architectures, and Python implementations
    --no-universal
    --no-emit-package: string # Specify a package to omit from the output resolution. Its dependencies will still be included in the resolution. Equivalent to pip-compile's `--unsafe-package` option
    --emit-index-url          # Include `--index-url` and `--extra-index-url` entries in the generated output file
    --no-emit-index-url
    --emit-find-links         # Include `--find-links` entries in the generated output file
    --no-emit-find-links
    --emit-build-options      # Include `--no-binary` and `--only-binary` entries in the generated output file
    --no-emit-build-options
    --emit-marker-expression  # Whether to emit a marker string indicating when it is known that the resulting set of pinned dependencies is valid
    --no-emit-marker-expression
    --emit-index-annotation   # Include comment annotations indicating the index used to resolve each package (e.g., `# from https://pypi.org/simple`)
    --no-emit-index-annotation
    --allow-unsafe
    --no-allow-unsafe
    --reuse-hashes
    --no-reuse-hashes
    --resolver: string@"nu-complete uv pip compile resolver"
    --max-rounds: string
    --cert: string
    --client-cert: string
    --emit-trusted-host
    --no-emit-trusted-host
    --config: string
    --no-config
    --emit-options
    --no-emit-options
    --pip-args: string
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip compile python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip compile python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip compile color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip sync index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv pip sync keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv pip sync link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv pip sync python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" ]
  }

  def "nu-complete uv pip sync python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip sync python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip sync color" [] {
    [ "auto" "always" "never" ]
  }

  # Sync an environment with a `requirements.txt` file
  export extern "uv pip sync" [
    ...src_file: string       # Include all packages listed in the given `requirements.txt` files
    --constraint(-c): string  # Constrain versions using the given requirements files
    --build-constraint(-b): string # Constrain build dependencies using the given requirements files when building source distributions
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv pip sync index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv pip sync keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv pip sync link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --require-hashes          # Require a matching hash for each requirement
    --no-require-hashes
    --verify-hashes           # Validate any hashes provided in the requirements file
    --no-verify-hashes
    --python(-p): string      # The Python interpreter into which packages should be installed.
    --system                  # Install packages into the system Python environment
    --no-system
    --break-system-packages   # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string          # Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory
    --prefix: string          # Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location
    --no-build                # Don't build source distributions
    --build
    --no-binary: string       # Don't install pre-built wheels
    --only-binary: string     # Only use pre-built wheels; don't build source distributions
    --allow-empty-requirements # Allow sync of empty requirements, which will clear the environment of all packages
    --no-allow-empty-requirements
    --python-version: string  # The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)
    --python-platform: string@"nu-complete uv pip sync python_platform" # The platform for which requirements should be installed
    --strict                  # Validate the Python environment after completing the installation, to detect and with missing dependencies or other issues
    --no-strict
    --dry-run                 # Perform a dry run, i.e., don't actually install anything but resolve the dependencies and print the resulting plan
    --ask(-a)
    --python-executable: string
    --user
    --cert: string
    --client-cert: string
    --config: string
    --no-config
    --pip-args: string
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip sync python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip sync python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip sync color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip install index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv pip install keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv pip install resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv pip install prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv pip install link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv pip install python_platform" [] {
    [ "windows" "linux" "macos" "x86_64-pc-windows-msvc" "i686-pc-windows-msvc" "x86_64-unknown-linux-gnu" "aarch64-apple-darwin" "x86_64-apple-darwin" "aarch64-unknown-linux-gnu" "aarch64-unknown-linux-musl" "x86_64-unknown-linux-musl" "x86_64-manylinux_2_17" "x86_64-manylinux_2_28" "x86_64-manylinux_2_31" "aarch64-manylinux_2_17" "aarch64-manylinux_2_28" "aarch64-manylinux_2_31" ]
  }

  def "nu-complete uv pip install python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip install python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip install color" [] {
    [ "auto" "always" "never" ]
  }

  # Install packages into an environment
  export extern "uv pip install" [
    ...package: string        # Install all listed packages
    --requirement(-r): string # Install all packages listed in the given `requirements.txt` files
    --editable(-e): string    # Install the editable package based on the provided local file path
    --constraint(-c): string  # Constrain versions using the given requirements files
    --override: string        # Override versions using the given requirements files
    --build-constraint(-b): string # Constrain build dependencies using the given requirements files when building source distributions
    --extra: string           # Include optional dependencies from the extra group name; may be provided more than once
    --all-extras              # Include all optional dependencies
    --no-all-extras
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --reinstall               # Reinstall all packages, regardless of whether they're already installed. Implies `--refresh`
    --no-reinstall
    --reinstall-package: string # Reinstall a specific package, regardless of whether it's already installed. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv pip install index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv pip install keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv pip install resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv pip install prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv pip install link_mode" # The method to use when installing packages from the global cache
    --compile-bytecode        # Compile Python files to bytecode after installation
    --no-compile-bytecode
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --no-deps                 # Ignore package dependencies, instead only installing those packages explicitly listed on the command line or in the requirements files
    --deps
    --require-hashes          # Require a matching hash for each requirement
    --no-require-hashes
    --verify-hashes           # Validate any hashes provided in the requirements file
    --no-verify-hashes
    --python(-p): string      # The Python interpreter into which packages should be installed.
    --system                  # Install packages into the system Python environment
    --no-system
    --break-system-packages   # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string          # Install packages into the specified directory, rather than into the virtual or system Python environment. The packages will be installed at the top-level of the directory
    --prefix: string          # Install packages into `lib`, `bin`, and other top-level folders under the specified directory, as if a virtual environment were present at that location
    --no-build                # Don't build source distributions
    --build
    --no-binary: string       # Don't install pre-built wheels
    --only-binary: string     # Only use pre-built wheels; don't build source distributions
    --python-version: string  # The minimum Python version that should be supported by the requirements (e.g., `3.7` or `3.7.9`)
    --python-platform: string@"nu-complete uv pip install python_platform" # The platform for which requirements should be installed
    --strict                  # Validate the Python environment after completing the installation, to detect and with missing dependencies or other issues
    --no-strict
    --dry-run                 # Perform a dry run, i.e., don't actually install anything but resolve the dependencies and print the resulting plan
    --disable-pip-version-check
    --user
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip install python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip install python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip install color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip uninstall keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv pip uninstall python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip uninstall python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip uninstall color" [] {
    [ "auto" "always" "never" ]
  }

  # Uninstall packages from an environment
  export extern "uv pip uninstall" [
    ...package: string        # Uninstall all listed packages
    --requirement(-r): string # Uninstall all packages listed in the given requirements files
    --python(-p): string      # The Python interpreter from which packages should be uninstalled.
    --keyring-provider: string@"nu-complete uv pip uninstall keyring_provider" # Attempt to use `keyring` for authentication for remote requirements files
    --allow-insecure-host: string # Allow insecure connections to a host
    --system                  # Use the system Python to uninstall packages
    --no-system
    --break-system-packages   # Allow uv to modify an `EXTERNALLY-MANAGED` Python installation
    --no-break-system-packages
    --target: string          # Uninstall packages from the specified `--target` directory
    --prefix: string          # Uninstall packages from the specified `--prefix` directory
    --disable-pip-version-check
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip uninstall python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip uninstall python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip uninstall color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip freeze python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip freeze python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip freeze color" [] {
    [ "auto" "always" "never" ]
  }

  # List, in requirements format, packages installed in an environment
  export extern "uv pip freeze" [
    --exclude-editable        # Exclude any editable packages from output
    --strict                  # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string      # The Python interpreter for which packages should be listed.
    --system                  # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip freeze python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip freeze python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip freeze color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip list format" [] {
    [ "columns" "freeze" "json" ]
  }

  def "nu-complete uv pip list python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip list python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip list color" [] {
    [ "auto" "always" "never" ]
  }

  # List, in tabular format, packages installed in an environment
  export extern "uv pip list" [
    --editable(-e)            # Only include editable projects
    --exclude-editable        # Exclude any editable packages from output
    --exclude: string         # Exclude the specified package(s) from the output
    --format: string@"nu-complete uv pip list format" # Select the output format between: `columns` (default), `freeze`, or `json`
    --strict                  # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string      # The Python interpreter for which packages should be listed.
    --system                  # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --outdated
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip list python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip list python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip list color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip show python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip show python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip show color" [] {
    [ "auto" "always" "never" ]
  }

  # Show information about one or more installed packages
  export extern "uv pip show" [
    ...package: string        # The package(s) to display
    --strict                  # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string      # The Python interpreter to find the package in.
    --system                  # Show a package in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip show python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip show python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip show color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip tree python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip tree python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip tree color" [] {
    [ "auto" "always" "never" ]
  }

  # Display the dependency tree for an environment
  export extern "uv pip tree" [
    --show-version-specifiers # Show the version constraint(s) imposed on each package
    --depth(-d): string       # Maximum display depth of the dependency tree
    --prune: string           # Prune the given package from the display of the dependency tree
    --package: string         # Display only the specified packages
    --no-dedupe               # Do not de-duplicate repeated dependencies. Usually, when a package has already displayed its dependencies, further occurrences will not re-display its dependencies, and will include a (*) to indicate it has already been shown. This flag will cause those duplicates to be repeated
    --invert                  # Show the reverse dependencies for the given package. This flag will invert the tree and display the packages that depend on the given package
    --strict                  # Validate the Python environment, to detect packages with missing dependencies and other issues
    --no-strict
    --python(-p): string      # The Python interpreter for which packages should be listed.
    --system                  # List packages in the system Python environment
    --no-system
    --disable-pip-version-check
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip tree python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip tree python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip tree color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv pip check python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv pip check python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv pip check color" [] {
    [ "auto" "always" "never" ]
  }

  # Verify installed packages have compatible dependencies
  export extern "uv pip check" [
    --python(-p): string      # The Python interpreter for which packages should be checked.
    --system                  # Check packages in the system Python environment
    --no-system
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv pip check python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv pip check python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv pip check color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv venv index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv venv keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv venv link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv venv python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv venv python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv venv color" [] {
    [ "auto" "always" "never" ]
  }

  # Create a virtual environment
  export extern "uv venv" [
    --python(-p): string      # The Python interpreter to use for the virtual environment.
    --system                  # Ignore virtual environments when searching for the Python interpreter
    --no-system               # This flag is included for compatibility only, it has no effect
    --no-project              # Avoid discovering a project or workspace
    --seed                    # Install seed packages (one or more of: `pip`, `setuptools`, and `wheel`) into the virtual environment
    --allow-existing          # Preserve any existing files or directories at the target path
    path?: string             # The path to the virtual environment to create
    --prompt: string          # Provide an alternative prompt prefix for the virtual environment.
    --system-site-packages    # Give the virtual environment access to the system site packages directory
    --relocatable             # Make the virtual environment relocatable
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --index-strategy: string@"nu-complete uv venv index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv venv keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv venv link_mode" # The method to use when installing packages from the global cache
    --clear
    --no-seed
    --no-pip
    --no-setuptools
    --no-wheel
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv venv python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv venv python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv venv color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv build index_strategy" [] {
    [ "first-index" "unsafe-first-match" "unsafe-best-match" ]
  }

  def "nu-complete uv build keyring_provider" [] {
    [ "disabled" "subprocess" ]
  }

  def "nu-complete uv build resolution" [] {
    [ "highest" "lowest" "lowest-direct" ]
  }

  def "nu-complete uv build prerelease" [] {
    [ "disallow" "allow" "if-necessary" "explicit" "if-necessary-or-explicit" ]
  }

  def "nu-complete uv build link_mode" [] {
    [ "clone" "copy" "hardlink" "symlink" ]
  }

  def "nu-complete uv build python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv build python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv build color" [] {
    [ "auto" "always" "never" ]
  }

  # Build Python packages into source distributions and wheels
  export extern "uv build" [
    src?: string              # The directory from which distributions should be built, or a source distribution archive to build into a wheel
    --package: string         # Build a specific package in the workspace
    --out-dir(-o): string     # The output directory to which distributions should be written
    --sdist                   # Build a source distribution ("sdist") from the given directory
    --wheel                   # Build a binary distribution ("wheel") from the given directory
    --build-constraint(-b): string # Constrain build dependencies using the given requirements files when building distributions
    --require-hashes          # Require a matching hash for each build requirement
    --no-require-hashes
    --verify-hashes           # Validate any hashes provided in the build constraints file
    --no-verify-hashes
    --python(-p): string      # The Python interpreter to use for the build environment.
    --index-url(-i): string   # The URL of the Python package index (by default: <https://pypi.org/simple>)
    --extra-index-url: string # Extra URLs of package indexes to use, in addition to `--index-url`
    --find-links(-f): string  # Locations to search for candidate distributions, in addition to those found in the registry indexes
    --no-index                # Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via `--find-links`
    --upgrade(-U)             # Allow package upgrades, ignoring pinned versions in any existing output file. Implies `--refresh`
    --no-upgrade
    --upgrade-package(-P): string # Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies `--refresh-package`
    --index-strategy: string@"nu-complete uv build index_strategy" # The strategy to use when resolving against multiple index URLs
    --keyring-provider: string@"nu-complete uv build keyring_provider" # Attempt to use `keyring` for authentication for index URLs
    --allow-insecure-host: string # Allow insecure connections to a host
    --resolution: string@"nu-complete uv build resolution" # The strategy to use when selecting between the different compatible versions for a given package requirement
    --prerelease: string@"nu-complete uv build prerelease" # The strategy to use when considering pre-release versions
    --pre
    --config-setting(-C): string # Settings to pass to the PEP 517 build backend, specified as `KEY=VALUE` pairs
    --no-build-isolation      # Disable isolation when building source distributions
    --no-build-isolation-package: string # Disable isolation when building source distributions for a specific package
    --build-isolation
    --exclude-newer: string   # Limit candidate packages to those that were uploaded prior to the given date
    --link-mode: string@"nu-complete uv build link_mode" # The method to use when installing packages from the global cache
    --no-sources              # Ignore the `tool.uv.sources` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any local or Git sources
    --no-build                # Don't build source distributions
    --build
    --no-build-package: string # Don't build source distributions for a specific package
    --no-binary               # Don't install pre-built wheels
    --binary
    --no-binary-package: string # Don't install pre-built wheels for a specific package
    --refresh                 # Refresh all cached data
    --no-refresh
    --refresh-package: string # Refresh cached data for a specific package
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv build python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv build python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv build color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv cache python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv cache python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv cache color" [] {
    [ "auto" "always" "never" ]
  }

  # Manage uv's cache
  export extern "uv cache" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv cache python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv cache python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv cache color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv cache clean python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv cache clean python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv cache clean color" [] {
    [ "auto" "always" "never" ]
  }

  # Clear the cache, removing all entries or those linked to specific packages
  export extern "uv cache clean" [
    ...package: string        # The packages to remove from the cache
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv cache clean python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv cache clean python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv cache clean color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv cache prune python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv cache prune python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv cache prune color" [] {
    [ "auto" "always" "never" ]
  }

  # Prune all unreachable objects from the cache
  export extern "uv cache prune" [
    --ci                      # Optimize the cache for persistence in a continuous integration environment, like GitHub Actions
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv cache prune python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv cache prune python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv cache prune color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv cache dir python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv cache dir python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv cache dir color" [] {
    [ "auto" "always" "never" ]
  }

  # Show the cache directory
  export extern "uv cache dir" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv cache dir python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv cache dir python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv cache dir color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv self python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv self python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv self color" [] {
    [ "auto" "always" "never" ]
  }

  # Manage the uv executable
  export extern "uv self" [
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv self python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv self python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv self color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv self update python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv self update python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv self update color" [] {
    [ "auto" "always" "never" ]
  }

  # Update uv
  export extern "uv self update" [
    target_version?: string   # Update to the specified version. If not provided, uv will update to the latest version
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv self update python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv self update python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv self update color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv clean python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv clean python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv clean color" [] {
    [ "auto" "always" "never" ]
  }

  # Clear the cache, removing all entries or those linked to specific packages
  export extern "uv clean" [
    ...package: string        # The packages to remove from the cache
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv clean python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv clean python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv clean color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv version output_format" [] {
    [ "text" "json" ]
  }

  def "nu-complete uv version python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv version python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv version color" [] {
    [ "auto" "always" "never" ]
  }

  # Display uv's version
  export extern "uv version" [
    --output-format: string@"nu-complete uv version output_format"
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv version python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv version python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv version color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

  def "nu-complete uv generate-shell-completion shell" [] {
    [ "bash" "elvish" "fish" "nushell" "powershell" "zsh" ]
  }

  def "nu-complete uv generate-shell-completion python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv generate-shell-completion color" [] {
    [ "auto" "always" "never" ]
  }

  def "nu-complete uv generate-shell-completion python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  # Generate shell completion
  export extern "uv generate-shell-completion" [
    shell: string@"nu-complete uv generate-shell-completion shell" # The shell to generate the completion script for
    --no-cache(-n)
    --cache-dir: string
    --python-preference: string@"nu-complete uv generate-shell-completion python_preference"
    --no-python-downloads
    --quiet(-q)
    --verbose(-v)
    --color: string@"nu-complete uv generate-shell-completion color"
    --native-tls
    --offline
    --no-progress
    --config-file: string
    --no-config
    --help(-h)
    --version(-V)
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --python-fetch: string@"nu-complete uv generate-shell-completion python_fetch" # Deprecated version of [`Self::python_downloads`]
    --no-color                # Disable colors
    --no-native-tls
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --directory: string       # Change to the given directory prior to running the command
  ]

  def "nu-complete uv help python_preference" [] {
    [ "only-managed" "managed" "system" "only-system" ]
  }

  def "nu-complete uv help python_fetch" [] {
    [ "automatic" "manual" "never" ]
  }

  def "nu-complete uv help color" [] {
    [ "auto" "always" "never" ]
  }

  # Display documentation for a command
  export extern "uv help" [
    --no-pager                # Disable pager when printing help
    ...command: string
    --no-cache(-n)            # Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation
    --cache-dir: string       # Path to the cache directory
    --python-preference: string@"nu-complete uv help python_preference" # Whether to prefer uv-managed or system Python installations
    --allow-python-downloads  # Allow automatically downloading Python when required. [env: "UV_PYTHON_DOWNLOADS=auto"]
    --no-python-downloads     # Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]
    --python-fetch: string@"nu-complete uv help python_fetch" # Deprecated version of [`Self::python_downloads`]
    --quiet(-q)               # Do not print any output
    --verbose(-v)             # Use verbose output
    --no-color                # Disable colors
    --color: string@"nu-complete uv help color" # Control colors in output
    --native-tls              # Whether to load TLS certificates from the platform's native certificate store
    --no-native-tls
    --offline                 # Disable network access
    --no-offline
    --preview                 # Whether to enable experimental, preview features
    --no-preview
    --isolated                # Avoid discovering a `pyproject.toml` or `uv.toml` file
    --show-settings           # Show the resolved settings for the current command
    --no-progress             # Hide all progress outputs
    --directory: string       # Change to the given directory prior to running the command
    --config-file: string     # The path to a `uv.toml` file to use for configuration
    --no-config               # Avoid discovering configuration files (`pyproject.toml`, `uv.toml`)
    --help(-h)                # Display the concise help for this command
    --version(-V)             # Display the uv version
  ]

}

export use completions *
