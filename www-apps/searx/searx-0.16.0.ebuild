# Copyright 2019 Haelwenn (lanodan) Monnier <contact@hacktivis.me>
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_6 python3_{4,5,6} )

inherit savedconfig distutils-r1

DESCRIPTION="Decentralized and privacy-respecting, hackable metasearch engine"
HOMEPAGE="https://github.com/asciimoo/searx https://searx.me"
SRC_URI="https://github.com/asciimoo/searx/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/certifi-2017.11.5[${PYTHON_USEDEP}]
	>=dev-python/flask-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/flask-babel-0.11.2[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.2.3[${PYTHON_USEDEP}]
	>=dev-python/idna-2.7[${PYTHON_USEDEP}]
	>=dev-python/pygments-2.1.3[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-18.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.13[${PYTHON_USEDEP}]
	>=dev-python/requests-2.19.1[socks5,${PYTHON_USEDEP}]
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"

src_prepare() {
	local mysecretkey="$(python -c 'import random; print("%x" % random.getrandbits(16*8))')"

	sed -i "s/ultrasecretkey/${mysecretkey}/g" searx/settings.yml || die "setting the secret key"

	restore_config searx/settings.yml

	sed -i "s;'tests/.*',$;;" setup.py || die "removing installation of tests"
	rm -r tests || die "removal of tests"

	distutils-r1_src_prepare
}

src_install() {
	distutils-r1_src_install

	save_config searx/settings.yml
}
