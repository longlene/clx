# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 python-utils-r1 vcs-snapshot

EGIT_COMMIT="544b744621b7c60097788c38594ea44973d0c8eb"

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
