# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Automates/provisions/manages/deploys infrastructure"
HOMEPAGE="https://pyinfra.com/ https://github.com/pyinfra-dev/pyinfra"
SRC_URI="https://github.com/pyinfra-dev/pyinfra/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

python_prepare_all() {
	# uv-dynamic-versioning requires git history; inject static version instead
	python3 - <<-EOF || die "Failed to patch pyproject.toml"
		import re, pathlib
		p = pathlib.Path("pyproject.toml")
		t = p.read_text()
		# Remove dynamic = ["version"] block
		t = re.sub(r'dynamic = \[\s*"version",?\s*\]\n', '', t)
		# Insert static version after [project] line
		t = t.replace('[project]\n', '[project]\nversion = "${PV}"\n', 1)
		# Remove uv-dynamic-versioning from build-system requires
		t = re.sub(r',?\s*"uv-dynamic-versioning"', '', t)
		t = re.sub(r'"uv-dynamic-versioning",?\s*', '', t)
		# Remove [tool.hatch.version] section
		t = re.sub(r'\[tool\.hatch\.version\][^\[]*', '', t)
		p.write_text(t)
	EOF
	distutils-r1_python_prepare_all
}

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/gevent-1.5[${PYTHON_USEDEP}]
		>=dev-python/paramiko-2.11[${PYTHON_USEDEP}]
		dev-python/click[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/python-dateutil[${PYTHON_USEDEP}]
		>=dev-python/typeguard-4[${PYTHON_USEDEP}]
		dev-python/distro[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.11[${PYTHON_USEDEP}]
		dev-python/types-paramiko[${PYTHON_USEDEP}]
	')
"
