# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

DESCRIPTION="coroutine/epoll network engine"
HOMEPAGE="http://www.xmailserver.org/coronet-lib.html"
SRC_URI="http://www.xmailserver.org/coronet-${PV}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-libs/pcl"
RDEPEND="${DEPEND}"
