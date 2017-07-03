# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="307fda57976a46418ce517ef2e70bcebe9a6aba1"

DESCRIPTION="A Common Lisp structured logger for Fluentd"
HOMEPAGE="https://github.com/fukamachi/cl-fluent-logger/"
SRC_URI="https://github.com/fukamachi/cl-fluent-logger/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
