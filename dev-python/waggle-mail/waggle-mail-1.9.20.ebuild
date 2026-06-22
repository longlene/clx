# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Multipart email for AI agents: send from Markdown via SMTP, IMAP client"
HOMEPAGE="https://github.com/jasonacox-sam/waggle-mail https://pypi.org/project/waggle-mail/"
SRC_URI="https://github.com/jasonacox-sam/waggle-mail/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="rich"

RDEPEND="
	rich? (
		$(python_gen_cond_dep '
			>=dev-python/markdown-3.4[${PYTHON_USEDEP}]
			>=dev-python/pygments-2.14[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest
