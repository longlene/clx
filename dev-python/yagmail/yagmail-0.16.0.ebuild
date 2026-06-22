# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Yet Another GMAIL client for sending email conveniently"
HOMEPAGE="https://github.com/kootenpv/yagmail"
SRC_URI="https://github.com/kootenpv/yagmail/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="dkim keyring"
RESTRICT="test"

# TODO: dev-python/premailer not yet in portage tree
RDEPEND="
	$(python_gen_cond_dep '
		dkim? ( dev-python/dkimpy[${PYTHON_USEDEP}] )
		keyring? ( dev-python/keyring[${PYTHON_USEDEP}] )
	')
"
BDEPEND="$(python_gen_cond_dep '
	>=dev-python/setuptools-61.0.0[${PYTHON_USEDEP}]
')"
