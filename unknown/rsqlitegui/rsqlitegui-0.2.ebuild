# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Ruby SQLite GUI is a simple, cross platform SQLite database administration tool written in Ruby"
HOMEPAGE="http://rsqlitegui.rubyforge.org/"
SRC_URI="http://rubyforge.org/frs/download.php/18233/${PN}_${PV}.tgz"
LICENSE="Ruby"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

DEPEND=">=dev-lang/ruby-1.8.2
	>=dev-ruby/ruby-gtk2-0.13
	>=dev-ruby/ruby-libglade2-0.12
	>=dev-ruby/sqlite3-ruby-1.0.0
	>=dev-ruby/activerecord-1.13.2"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}_${PV}"


src_install() {
	insinto "/usr/share/${P}"
	doins *.rb *.glade
	if use doc; then
		dodoc CHANGELOG README
	fi
	# create the wrapper without using the install.rb
	mkdir -p ${D}/usr/bin
	MY_WRAPPER=${D}/usr/bin/${PN}
	echo "#!/usr/bin/ruby" >> ${MY_WRAPPER}
	echo "\`ruby /usr/share/${P}/rsqlitegui.rb $@\`" >> ${MY_WRAPPER}
	chmod 0755 ${MY_WRAPPER}
}
