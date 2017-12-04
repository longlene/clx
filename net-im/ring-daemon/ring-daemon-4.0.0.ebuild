# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="GNU Ring is a Voice-over-IP software phone"
HOMEPAGE="https://github.com/savoirfairelinux/ring-daemon"
SRC_URI="https://github.com/savoirfairelinux/ring-daemon/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-misc/pjproject
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	./autogen.sh || die
}
