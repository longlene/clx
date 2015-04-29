# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Unix-style command line options parser"
HOMEPAGE="https://github.com/mrkkrp/unix-opts/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mrkkrp/unix-opts.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-asdf unix-opts.asd
	common-lisp-install-sources unix-opts.lisp
}
