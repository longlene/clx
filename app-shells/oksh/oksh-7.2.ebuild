# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Portable OpenBSD ksh"
HOMEPAGE="https://github.com/ibara/oksh"
SRC_URI="https://github.com/ibara/oksh/archive/refs/tags/oksh-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
S="${WORKDIR}"/${PN}-${P}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_configure() {
	econf --no-strip
}
