# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3cb786797b24883d784b7350e7372e8b1e743508"

DESCRIPTION="Graph manipulation utilities for Common Lisp."
HOMEPAGE="http://common-lisp.net/project/cl-graph"
SRC_URI="https://github.com/gwkkwg/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/asdf-system-connections
	>=dev-lisp/metatilities-base-0.6.0
	>=dev-lisp/cl-containers-0.12.0
	dev-lisp/metabang-bind
	dev-lisp/cl-variates
	dev-lisp/cl-graphviz
	dev-lisp/metacopy
	dev-lisp/cl-mathstats
	dev-lisp/dynamic-classes
	>=dev-lisp/moptilities-0.3.10
	test? ( dev-lisp/lift )
"

CLSYSTEMS="${PN} ${PN}-test"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd unit-tests
	rm -r dev/examples
}

