# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="An OTP library for the manipulation of a binary representation of dates and times"
HOMEPAGE="https://github.com/nomasystems/ncalendar"
SRC_URI="https://github.com/nomasystems/ncalendar/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
