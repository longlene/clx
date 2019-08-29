# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The all-language autocompleter"
HOMEPAGE="https://tabnine.com/"
SRC_URI="
	x86? ( https://update.tabnine.com/${PV}/i686-unknown-linux-gnu/TabNine -> TabNine-x86-${PV} )
	amd64? ( https://update.tabnine.com/${PV}/x86_64-unknown-linux-gnu/TabNine -> TabNine-amd64-${PV} )
"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

QA_PRESTRIPPED="/usr/bin/TabNine"

src_install() {
	newbin ${DISTDIR}/${A} TabNine
}
