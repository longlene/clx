# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

EGIT_COMMIT="0c8a047ebda77e35fc9c514585e7a523a3fc8cfa"

DESCRIPTION="Erlang driver for nanomsg"
HOMEPAGE="https://github.com/basho/enm"
SRC_URI="https://github.com/basho/enm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
