# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1

DESCRIPTION="Web apps in pure Python"
HOMEPAGE="https://github.com/reflex-dev/reflex"
SRC_URI="https://github.com/reflex-dev/reflex/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/fastapi-0.96.0[${PYTHON_USEDEP}]
	>=dev-python/gunicorn-20.1.0[${PYTHON_USEDEP}]
	>=dev-python/jinja-3.1.2[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.9.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.2[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.5[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.7.0[${PYTHON_USEDEP}]
	>=dev-python/redis-4.3.5[${PYTHON_USEDEP}]
	>=dev-python/rich-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/sqlmodel-0.0.14[${PYTHON_USEDEP}]
	>=dev-python/typer-0.4.2[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-admin-0.11.0[${PYTHON_USEDEP}]
	>=dev-python/alembic-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.10.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.8.0[${PYTHON_USEDEP}]
	dev-python/python-engineio[${PYTHON_USEDEP}]
	>=dev-python/wrapt-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.1[${PYTHON_USEDEP}]
	>=dev-python/reflex-hosting-cli-0.1.2[${PYTHON_USEDEP}]
	>=dev-python/charset-normalizer-3.3.2[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.42.0[${PYTHON_USEDEP}]
	>=dev-python/build-1.0.3[${PYTHON_USEDEP}]
	>=dev-python/setuptools-75.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.25.1[${PYTHON_USEDEP}]
	>=dev-python/twine-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.12.4[${PYTHON_USEDEP}]
	>=dev-python/lazy_loader-0.4[${PYTHON_USEDEP}]
	>=dev-python/reflex-chakra-0.6.0[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
