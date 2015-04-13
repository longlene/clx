# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby19 ruby20 ruby21 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A standard and simplified API for communicating with RDBMS from Ruby"
HOMEPAGE="https://github.com/datamapper/do"

LICENSE="as-is"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/addressable-2.1"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
