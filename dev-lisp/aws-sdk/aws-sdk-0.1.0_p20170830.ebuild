# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f62d0b32260fc43165637e710d6082aaf04fabcb"

DESCRIPTION="AWS SDK for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/aws-sdk-lisp"
SRC_URI="https://github.com/fukamachi/aws-sdk-lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
