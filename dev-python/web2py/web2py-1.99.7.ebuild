# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit eutils

DESCRIPTION="Python framework for rapid development of database-driven web-based applications."
HOMEPAGE="http://www.web2py.com/"
SRC_URI="http://web2py.com/examples/static/${PV}/web2py_src.zip -> ${P}.zip"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="doc mysql postgres sqlite test"

RDEPEND="dev-python/imaging
	sqlite? ( dev-python/pysqlite:2 )
	postgres? ( dev-python/psycopg )"
DEPEND="app-arch/tar"

src_install() {
	# Install init scripts
	newinitd "${FILESDIR}"/web2py.initd web2py || die
	newconfd "${FILESDIR}"/web2py.confd web2py || die

	# Install configuration files
	insinto "/etc/web2py"
	newins "web2py/options_std.py" "options.py" || die "installing config files failed"

	# Move applications to var/lib
	keepdir "/var/lib/web2py/"
	insinto "/var/lib/web2py/"
	doins -r "web2py/applications" || die "installing applications failed"
	rm -R "web2py/applications"
	dodir "/var/lib/web2py/deposit"

	# Create the application template
	rm "web2py/NEWINSTALL"
	tar c -z -f "${D}/var/lib/web2py/welcome.w2p" -C "${D}/var/lib/web2py/applications/welcome" "."

	# Install web2py core files
	insinto "/usr/lib/web2py"
	doins -r "web2py"/* || die "installing gluon failed"
}
