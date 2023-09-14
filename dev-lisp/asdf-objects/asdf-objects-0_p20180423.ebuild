# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d84582ead068a2a2a00cf04293a18c85abe9cc4"

DESCRIPTION="in-memory objects/dependencies for ASDF"
HOMEPAGE="https://github.com/slyrus/asdf-objects"
SRC_URI="https://github.com/slyrus/asdf-objects/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
