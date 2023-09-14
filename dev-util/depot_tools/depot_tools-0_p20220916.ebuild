# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit python-r1

EGIT_COMMIT="18bdadc98ab6f94912ad97e9b9fda170777c5b7f"

DESCRIPTION="Chromium uses a package of scripts, the depot_tools, to manage interaction with the Chromium source code repository and the Chromium development process"
HOMEPAGE="https://dev.chromium.org/developers/how-tos/install-depot-tools"
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc zsh-completions"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	doman man/man7/${PN}{,_tutorial}.7
	python_newscript gclient.py gclient
	python_newscript fetch.py fetch
	python_newscript gn.py gn
	python_doscript repo
	if use zsh-completions ; then
		insinto /usr/share/zsh/site-functions
		doins zsh-goodies/_*
	fi
	dodoc README.md
}
