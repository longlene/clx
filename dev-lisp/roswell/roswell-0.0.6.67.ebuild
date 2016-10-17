# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools common-lisp-3

DESCRIPTION="Common Lisp environment setup Utility"
HOMEPAGE="https://github.com/snmsts/roswell"
SRC_URI="https://github.com/snmsts/roswell/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

src_install() {
	emake install
	common
}
