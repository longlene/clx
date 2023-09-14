# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fff42f8f8fd0d99db5ad6c5812e53de7d660020b"

DESCRIPTION="CL environment introspection portability layer"
HOMEPAGE="https://github.com/Bike/introspect-environment"
SRC_URI="https://github.com/Bike/introspect-environment/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
