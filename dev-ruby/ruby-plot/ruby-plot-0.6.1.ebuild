# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby18 ruby19 ruby20 ree18 jruby"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="AUTHORS.txt ChangeLog README.textile"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Gnuplot drawing library - Ruby Bindings"
HOMEPAGE="https://github.com/davor/ruby-plot"

LICENSE="BSD"
KEYWORDS="~amd64 ~ppc ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND} sci-visualization/gnuplot"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
