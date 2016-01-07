# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A date and time library based on the C++11"
HOMEPAGE="https://github.com/HowardHinnant/date"
SRC_URI=""

EGIT_REPO_URI="https://github.com/HowardHinnant/date.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins date.h iso_week.h tz.h
	# TODO: add tz.h
}
