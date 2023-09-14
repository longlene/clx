# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="07dafe9b351c32326ce20b5804e798f10d4f273d"

DESCRIPTION='CL-WHO (is yet another Lisp Markup Language).'
HOMEPAGE="http://weitz.de/cl-who/"
SRC_URI="https://github.com/edicl/${PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

