# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..13} )

inherit distutils-r1 pypi

EGIT_COMMIT="9b651be3013c56cb826e0bfd9808a0d741bfd4b9"

DESCRIPTION="Python bindings for Nanomsg Next Generation"
HOMEPAGE="https://github.com/codypiersall/pynng"
SRC_URI="
	https://github.com/codypiersall/pynng/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/nanomsg/nng/archive/refs/tags/v1.9.0.tar.gz -> nng-1.9.0.tar.gz
	https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/v3.6.2.tar.gz -> mbedtls-3.6.2.tar.gz
	https://github.com/Mbed-TLS/mbedtls-framework/archive/94599c0e3b5036e086446a51a3f79640f70f22f6.tar.gz -> mbedtls-framework-94599c0e3b5036e086446a51a3f79640f70f22f6.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"
#
distutils_enable_tests pytest

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	ln -sv "${WORKDIR}"/nng-1.9.0 "${S}"/nng
	ln -sv "${WORKDIR}"/mbedtls-3.6.2 "${S}"/mbedtls
	rmdir "${WORKDIR}"/mbedtls-3.6.2/framework && ln -sv "${WORKDIR}"/mbedtls-framework-94599c0e3b5036e086446a51a3f79640f70f22f6 "${WORKDIR}"/mbedtls-3.6.2/framework
	distutils-r1_src_prepare
}
