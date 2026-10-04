# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_14 )

inherit distutils-r1

DESCRIPTION="Scalable, user-friendly build system for Python-first projects"
HOMEPAGE="
	https://github.com/pantsbuild/pants
	https://www.pantsbuild.org
"
# Official prebuilt wheels (cp314, manylinux x86_64/aarch64) from GitHub
# releases; pants 2.x is not on PyPI and has no supported bootstrap-free
# source build.
MY_CP="cp314"
WHL="pantsbuild_pants-${PV}-${MY_CP}-${MY_CP}-manylinux2014_x86_64.whl"
SRC_URI="
	https://github.com/pantsbuild/pants/releases/download/release_${PV}/${WHL}
"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="$(python_gen_cond_dep '
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/ansicolors-1.1.8[${PYTHON_USEDEP}]
		>=dev-python/chevron-0.14.0[${PYTHON_USEDEP}]
		>=dev-python/fasteners-0.20[${PYTHON_USEDEP}]
		>=dev-python/ijson-3.4.0[${PYTHON_USEDEP}]
		>=dev-python/node-semver-0.9.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.41.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.41.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.41.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-26.0[${PYTHON_USEDEP}]
		>=dev-python/psutil-7.2.2[${PYTHON_USEDEP}]
		>=dev-python/python-lsp-jsonrpc-1.1.2[${PYTHON_USEDEP}]
		>=dev-python/setproctitle-1.3.7[${PYTHON_USEDEP}]
		>=dev-python/toml-0.10.2[${PYTHON_USEDEP}]
		>=dev-python/types-pyyaml-6.0.12[${PYTHON_USEDEP}]
		>=dev-python/types-toml-0.10.8[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.15[${PYTHON_USEDEP}]
	')
"

QA_PRESTRIPPED="
	/usr/lib/python3.14/site-packages/native_engine.cpython-314-x86_64-linux-gnu.so
"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/${WHL}"
}
