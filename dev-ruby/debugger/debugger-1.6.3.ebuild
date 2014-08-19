# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby19 ruby20 ree18 jruby ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="A fast implementation of the standard Ruby debugger"
HOMEPAGE="https://github.com/cldwalker/debugger"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
>=dev-ruby/columnize-0.3.1
>=dev-ruby/debugger-linecache-1.2.0
>dev-ruby/debugger-ruby_core_source-1.2.4"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
