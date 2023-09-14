# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="3a81f3cc3060be86064ba2e666d30b0c358cc847"

DESCRIPTION="C-family Abstract Syntax Tree XML Output"
HOMEPAGE="https://github.com/CastXML/CastXML"
SRC_URI="https://github.com/CastXML/CastXML/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="sys-devel/llvm"
RDEPEND="${DEPEND}"
