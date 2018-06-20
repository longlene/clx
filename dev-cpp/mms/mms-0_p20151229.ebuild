# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

EGIT_COMMIT="242bd540b62a450d0fc409b7b3a0422232cc005d"

DESCRIPTION="Memory-mapped storage library"
HOMEPAGE="https://github.com/yandex/mms"
SRC_URI="https://github.com/yandex/mms/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
