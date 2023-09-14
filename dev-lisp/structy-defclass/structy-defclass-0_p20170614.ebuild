# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fe2ca1a6fac456fe2f3cee32c47deca80e016edc"

DESCRIPTION="Make classes like structs"
HOMEPAGE="https://github.com/cbaggers/structy-defclass"
SRC_URI="https://github.com/cbaggers/structy-defclass/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
