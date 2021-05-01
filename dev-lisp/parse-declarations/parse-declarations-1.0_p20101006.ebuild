# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Library to parse and rebuild declarations"
HOMEPAGE="https://common-lisp.net/project/parse-declarations/"
SRC_URI="http://beta.quicklisp.org/archive/parse-declarations/2010-10-06/parse-declarations-20101006-darcs.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
