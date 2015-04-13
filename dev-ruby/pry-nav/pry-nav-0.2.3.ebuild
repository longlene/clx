# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Binding navigation commands for Pry to make a simple debugger"
HOMEPAGE="https://github.com/nixme/pry-nav"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>dev-ruby/pry-0.9.10"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
