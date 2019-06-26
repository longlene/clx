# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c4dea294f4a0037e3af350f3a8cccd6700b05d04"

DESCRIPTION="A parser that parses HTML documents and generates a sexp-based representation."
HOMEPAGE="http://www.cl-user.net/asp/libs/cl-html-parse
		http://www.cliki.net/CL-HTML-Parse"
SRC_URI="https://github.com/gwkkwg/cl-html-parse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README
}
