# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="31aa85377f8c425fe7a1f38084af54f93f321d4b"

DESCRIPTION="Common Lisp Implementation of the XML Path Language (XPath)"
HOMEPAGE="https://github.com/sharplispers/xpath"
SRC_URI="https://github.com/sharplispers/xpath/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	dev-lisp/parse-number
	dev-lisp/cl-ppcre
	dev-lisp/cl-yacc
"
BDEPEND=""
