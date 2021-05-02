# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Embeddable Event-based Asynchronous Message/HTTP Server library"
HOMEPAGE="http://wolkykim.github.io/libasyncd/"
SRC_URI="https://github.com/wolkykim/libasyncd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/qlibc"
RDEPEND="${DEPEND}"
