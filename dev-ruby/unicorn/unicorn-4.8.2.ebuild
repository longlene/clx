# Copyright 1999-2013 Gentoo Foundation

EAPI=8
USE_RUBY="ruby18 ruby19 ruby20 ruby21 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Unicorn is an HTTP server for Rack application"
HOMEPAGE="http://unicorn.bogomips.org"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/kgio-2.6
>=dev-ruby/rack-0
>=dev-ruby/raindrops-0.7"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
