# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3

DESCRIPTION="An acronym expander that utilizes a templating system"
HOMEPAGE="https://github.com/isoraqathedh/cl-acronyms/"
SRC_URI="https://github.com/isoraqathedh/cl-acronyms/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
