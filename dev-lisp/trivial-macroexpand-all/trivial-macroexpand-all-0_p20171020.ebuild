# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="933270ac7107477de1bc92c1fd641fe646a7a8a9"

DESCRIPTION="macroexpand-all function that calls each implementation's equivalent"
HOMEPAGE="https://github.com/cbaggers/trivial-macroexpand-all/"
SRC_URI="https://github.com/cbaggers/trivial-macroexpand-all/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
