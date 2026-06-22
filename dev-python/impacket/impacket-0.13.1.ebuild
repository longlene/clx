# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

MY_PV="${PV//./_}"

inherit distutils-r1

DESCRIPTION="Collection of Python classes for working with network protocols"
HOMEPAGE="https://www.coresecurity.com https://github.com/fortra/impacket"
SRC_URI="https://github.com/fortra/impacket/archive/refs/tags/impacket_${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/impacket-impacket_${MY_PV}"

LICENSE="Apache-1.1"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/charset-normalizer[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/ldap3[${PYTHON_USEDEP}]
		dev-python/pyasn1[${PYTHON_USEDEP}]
		dev-python/pyasn1-modules[${PYTHON_USEDEP}]
		dev-python/pyopenssl[${PYTHON_USEDEP}]
		dev-python/pycryptodomex[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/ldapdomaindump[${PYTHON_USEDEP}]
	')
"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/setuptools[${PYTHON_USEDEP}]
	')
"

RESTRICT="test"

python_install_all() {
	distutils-r1_python_install_all
	# setup.py installs to /usr/share/doc/${PN} — move to versioned dir
	rm -rf "${ED}/usr/share/doc/${PN}" || die
	dodoc README.md LICENSE
}
