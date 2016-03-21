# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A Common Lisp library that provides a namespace for readtables."
HOMEPAGE="http://common-lisp.net/project/editor-hints/"
EGIT_REPO_URI="git://github.com/melisgl/named-readtables"

LICENSE="BSD"
KEYWORDS="~amd64 ~arm ~x86"
SLOT="0"
IUSE="doc"

src_install() {
	common-lisp-install-sources src test
	common-lisp-install-asdf
	use doc && dohtml doc/${PN}.html
}
