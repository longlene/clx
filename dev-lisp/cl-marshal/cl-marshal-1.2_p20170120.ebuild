# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9369672b6e30bf189a68c73b049fe926625c7aeb"

DESCRIPTION="Simple and fast serialization of all kinds of Common Lisp data structures"
HOMEPAGE="https://github.com/wlbr/cl-marshal"
SRC_URI="https://github.com/wlbr/cl-marshal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	rm tests.lisp
}
