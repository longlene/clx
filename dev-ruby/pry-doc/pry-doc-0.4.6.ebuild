# Copyright 1999-2013 Gentoo Foundation

EAPI=7
USE_RUBY="ruby19 ruby20 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Provides YARD and extended documentation support for Pry"
HOMEPAGE="https://github.com/pry/pry-doc"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/pry-0.9
>=dev-ruby/yard-0.8"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
