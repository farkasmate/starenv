#!/bin/bash -eu

cat > "${ENV_CLI_FILE}" <<-CLI
	#!/bin/bash -eu

	echo "${ENV_CLI_NAME} version: ${ENV_VERSION}"
	echo "args:"
	for arg in "\${@}"
	do
	  echo "  \${arg}"
	done
CLI

chmod a+x "${ENV_CLI_FILE}"
