# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="ACL2 is both a programming language in which you can model computer systems and a tool to help you prove properties of those models"
HOMEPAGE="http://www.cs.utexas.edu/users/moore/acl2/"
SRC_URI="https://github.com/acl2/acl2/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-lisp/sbcl"
RDEPEND="${DEPEND}"

src_compile() {
	emake LISP=sbcl
}

src_install() {
	cat >> acl2 <<EOF
#!/bin/sh
exec "sbcl" --dynamic-space-size 24000 --control-stack-size 64 --core "/usr/$(get_libdir)/${P}/saved_acl2.core" --end-runtime-options --no-userinit --eval '(acl2::sbcl-restart)' "$@"
EOF
	dobin acl2

	insinto /usr/$(get_libdir)/${P}
	doins -r books saved_acl2.core
	dodoc README.md
}
