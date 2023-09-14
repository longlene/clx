# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Lisp parser and generator for the JSON data-interchange format"
HOMEPAGE="http://common-lisp.net/project/cl-json/
		http://www.cliki.net/cl-json"
SRC_URI="https://github.com/sharplispers/cl-json/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :cl-json.test/,$d' \
		-i ${PN}.asd
	rm -rf t
}
