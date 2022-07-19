# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="AirPlay Unix mirroring server"
HOMEPAGE="https://github.com/FDH2/UxPlay"
SRC_URI="https://github.com/FDH2/UxPlay/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-pda/libplist
	net-dns/avahi
"
RDEPEND="${DEPEND}"
BDEPEND=""
