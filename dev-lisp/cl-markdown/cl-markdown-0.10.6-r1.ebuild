# Copyright 2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="CL-Markdown is a Common Lisp rewrite of Markdown."
HOMEPAGE="http://common-lisp.net/project/cl-markdown"
SRC_URI="https://github.com/gwkkwg/${PN}/tarball/version-${PV}_version-${PV} -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="
	>=dev-lisp/metatilities-base-0.6.0
	dev-lisp/metabang-bind
	>=dev-lisp/cl-containers-0.11.5
	dev-lisp/dynamic-classes
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
"

src_prepare() {
	default
	rm -rf ${PN}-test.asd unit-tests
}
