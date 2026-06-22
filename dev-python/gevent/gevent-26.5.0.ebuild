# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Coroutine-based network library"
HOMEPAGE="http://www.gevent.org/ https://github.com/gevent/gevent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DEPEND="
	dev-libs/libev:=
	dev-libs/libuv:=
	net-dns/c-ares:=
"
RDEPEND="
	${DEPEND}
	>=dev-python/greenlet-3.2.2[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/zope-event[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/cython-3.2.4[${PYTHON_USEDEP}]
	dev-python/cffi[${PYTHON_USEDEP}]
	>=dev-python/greenlet-3.2.2[${PYTHON_USEDEP}]
"

python_compile() {
	GEVENTSETUP_EMBED=0 distutils-r1_python_compile
}
