# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="An Erlang Lightweight XMPP Client library"
HOMEPAGE="https://github.com/snatch-xmpp/snatch"
SRC_URI="https://github.com/snatch-xmpp/snatch/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/fast_xml-1.1.24
"
BDEPEND=""
