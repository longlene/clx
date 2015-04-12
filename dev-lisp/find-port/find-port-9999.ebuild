# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Find open ports programmatically"
HOMEPAGE="https://github.com/eudoxia0/find-port"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/find-port.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
