# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="cfef24124a2f10759db20d7595ea4d188e521b55"

DESCRIPTION="Image processing library implemented as Erlang NIF"
HOMEPAGE="https://github.com/eyedouble/erlimage"
SRC_URI="https://github.com/eyedouble/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

