# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Free, open-source local AWS emulator — drop-in LocalStack replacement"
HOMEPAGE="https://ministack.org https://github.com/ministackorg/ministack"
SRC_URI="https://github.com/ministackorg/ministack/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="full"
RESTRICT="test"

RDEPEND="
	app-admin/awscli
	$(python_gen_cond_dep '
		dev-python/cbor2[${PYTHON_USEDEP}]
		dev-python/defusedxml[${PYTHON_USEDEP}]
		dev-python/docker[${PYTHON_USEDEP}]
		>=dev-python/hypercorn-0.18.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		full? (
			dev-python/asyncssh[${PYTHON_USEDEP}]
			dev-python/cryptography[${PYTHON_USEDEP}]
			dev-python/pymysql[${PYTHON_USEDEP}]
		)
	')
"

src_install() {
	distutils-r1_src_install
	dobin bin/awslocal
}
