# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="ChangeLog.markdown README.markdown"

inherit multilib ruby-fakegem

DESCRIPTION="A DataObjects driver for SQLite3"
HOMEPAGE="http://rubyforge.org/projects/dorb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

# Specs depend on spec files from data_objects, which we no longer
# install by default.
RESTRICT="test"

RDEPEND="${RDEPEND} dev-db/sqlite:3"
DEPEND="${DEPEND} dev-db/sqlite:3"

ruby_add_rdepend "=dev-ruby/data_objects-0.10.2"

each_ruby_configure() {
	${RUBY} -Cext/do_sqlite3 extconf.rb || die
}

each_ruby_compile() {
	# We have injected --no-undefined in Ruby as a safety precaution
	# against broken ebuilds, but these bindings unfortunately rely on
	# the lazy load of other extensions; see bug #320545.
	find . -name Makefile -print0 | xargs -0 \
		sed -i -e 's:-Wl,--no-undefined::' || die "--no-undefined removal failed"

	emake -Cext/do_sqlite3 || die
	mv ext/do_sqlite3/*$(get_modname) lib/ || die
}
