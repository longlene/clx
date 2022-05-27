# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="Common library for all Osmocom projects"
HOMEPAGE="https://osmocom.org/projects/libosmocore"
SRC_URI="https://gitea.osmocom.org/osmocom/libosmocore/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libusb
	sys-libs/talloc
	sys-apps/pcsc-lite
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
