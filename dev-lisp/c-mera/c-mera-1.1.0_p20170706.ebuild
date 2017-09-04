# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools vcs-snapshot

EGIT_COMMIT="301d2986b6890dcfee53d8bc8e14f28b27922989"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/kiselgra/c-mera/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
