# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_TEST="spec"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit multilib ruby-fakegem

DESCRIPTION="Implements the DataObjects API for Sqlite3"
HOMEPAGE="http://datamapper.org/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND+="dev-db/sqlite:3"

ruby_add_bdepend "doc? ( >=dev-ruby/yard-0.8.7 )"
ruby_add_bdepend "test? ( dev-ruby/rspec:2 )"

ruby_add_rdepend "dev-ruby/data_objects"

all_ruby_prepare() {
	cp "${FILESDIR}/${PN}.gemspec" "${WORKDIR}/all/${P}/${PN}.gemspec"
	sed -i -e 's/, :compile//g' tasks/spec.rake
	sed -i -e 's/.so//g' Rakefile
}

each_ruby_configure() {
	${RUBY} -Cext/do_sqlite3 extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/do_sqlite3 V=1
	mv ext/do_sqlite3/*$(get_modname) lib/do_sqlite3 || die
}
