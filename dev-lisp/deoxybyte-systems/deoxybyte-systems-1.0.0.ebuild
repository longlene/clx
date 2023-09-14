# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Utilities for Common Lisp ASDF systems"
HOMEPAGE="https://github.com/keithj/deoxybyte-systems"
SRC_URI="https://github.com/keithj/deoxybyte-systems/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
"
BDEPEND=""
