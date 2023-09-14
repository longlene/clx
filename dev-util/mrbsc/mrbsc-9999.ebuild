# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3

DESCRIPTION="MRuBy SCaffolding tool"
HOMEPAGE="https://github.com/nesterow/mrbsc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nesterow/mrbsc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/ruby
	dev-vcs/git
"

src_install() {
	dobin mrbsc
	dodoc readme.md
}
