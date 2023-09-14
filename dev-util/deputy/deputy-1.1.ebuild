# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="Deputy is a C compiler that is capable of preventing common C programming errors"

# Homepage, not used by Portage directly but handy for developer reference
HOMEPAGE="http://deputy.cs.berkeley.edu/"

# Point to any required sources; these will be automatically downloaded by
# Portage.
SRC_URI="http://deputy.cs.berkeley.edu/${P}.tar.gz"

# License of the package.  This must match the name of file(s) in
# /usr/portage/licenses/.  For complex license combination see the developer
# docs on gentoo.org for details.
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# ocaml version guessed from configure.in but does it's a DEPEND or a RDEPEND ?
DEPEND=">=dev-lang/ocaml-3.08"
RDEPEND="${DEPEND}"

src_compile() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	einstall || die "einstall failed"
}
