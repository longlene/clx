# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="A lightweight C++11 Distributed Hash Table implementation"
HOMEPAGE="https://github.com/savoirfairelinux/opendht"
SRC_URI="https://github.com/savoirfairelinux/opendht/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND=">=dev-libs/msgpack-1.2
	>=dev-libs/nettle-3
	net-libs/gnutls"
RDEPEND="${DEPEND}"

