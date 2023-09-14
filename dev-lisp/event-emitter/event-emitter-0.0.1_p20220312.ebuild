# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1de163a8241180082f6149300bf0e1b46fe199cb"

DESCRIPTION="Event mechanism for Common Lisp objects"
HOMEPAGE="https://github.com/fukamachi/event-emitter"
SRC_URI="https://github.com/fukamachi/event-emitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}
