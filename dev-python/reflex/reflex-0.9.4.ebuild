# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Web apps in pure Python"
HOMEPAGE="https://github.com/reflex-dev/reflex https://reflex.dev"
SRC_URI="https://github.com/reflex-dev/reflex/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="db"
RESTRICT="test"

BDEPEND="
	dev-python/uv-dynamic-versioning[${PYTHON_USEDEP}]
"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/click[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.26[${PYTHON_USEDEP}]
		>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.20[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.12.0[${PYTHON_USEDEP}]
		>=dev-python/redis-6.4[${PYTHON_USEDEP}]
		>=dev-python/rich-13[${PYTHON_USEDEP}]
		>=dev-python/starlette-0.47.0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
		>=dev-python/wrapt-1.17.0[${PYTHON_USEDEP}]
		db? (
			>=dev-python/alembic-1.15.2[${PYTHON_USEDEP}]
			>=dev-python/pydantic-2.12.0[${PYTHON_USEDEP}]
			>=dev-python/sqlmodel-0.0.24[${PYTHON_USEDEP}]
		)
	')
"

python_prepare_all() {
	# Set static version for tarball builds (uv-dynamic-versioning requires git)
	sed -i \
		-e 's/dynamic = \["version"\]/version = "'"${PV}"'"/' \
		-e '/^\[tool\.hatch\.version\]/,/^\[tool\./{ /^\[tool\.hatch\.version\]/d; /^source = "uv-dynamic-versioning"/d }' \
		pyproject.toml

	# Restrict wheel to reflex/ only; without this hatchling auto-discovers tests/, packages/, scripts/
	sed -i \
		's/^targets\.wheel\.artifacts = \["\*\.pyi"\]$/&\ntargets.wheel.packages = ["reflex"]/' \
		pyproject.toml

	# Disable pyi regeneration hook — requires reflex_base to be installed
	cat > scripts/hatch_build.py <<-'EOF'
		from hatchling.builders.hooks.plugin.interface import BuildHookInterface

		class CustomBuilder(BuildHookInterface):
		    PLUGIN_NAME = "custom"
		    def initialize(self, version, build_data):
		        pass
	EOF

	distutils-r1_python_prepare_all
}
