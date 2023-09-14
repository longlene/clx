# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7f70362dba2c59bb61e9419d998407bdc62ea00b"

DESCRIPTION="A Simple Common Lisp IRC client library"
HOMEPAGE="https://github.com/jorams/birch"
SRC_URI="https://github.com/jorams/birch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/alexandria
"

src_prepare() {
	use test || rm -rf test birch.test.asd
}
