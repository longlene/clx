# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 )
inherit git-r3 python-single-r1 python-utils-r1

DESCRIPTION="Chromium uses a package of scripts, the depot_tools, to manage interaction with the Chromium source code repository and the Chromium development process"
HOMEPAGE="https://dev.chromium.org/developers/how-tos/install-depot-tools"
SRC_URI=""

EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git"

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
