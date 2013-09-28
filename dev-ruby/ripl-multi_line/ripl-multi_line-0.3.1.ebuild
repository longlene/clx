# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby18 ruby19 ruby20 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="This ripl plugin allows you to evaluate multiple lines of Ruby code"
HOMEPAGE="http://github.com/janlelis/ripl-multi_line"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/ripl-0.3.6"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
