# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp library to parse Atom and RSS feeds"
HOMEPAGE="https://github.com/kisom/cl-feedparse"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kisom/cl-feedparse.git"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/s-xml
dev-lisp/flexi-streams
dev-lisp/drakma
"

src_prepare() {
	mv README.org README.markdown
}

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf feedparse.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf feedparse-test.asd
	fi
}
