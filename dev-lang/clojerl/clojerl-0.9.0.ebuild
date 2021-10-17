# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="Clojure for the Erlang VM"
HOMEPAGE="http://try.clojerl.online/"
SRC_URI="https://github.com/clojerl/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md )

