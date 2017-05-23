# Copyright 1999-2013 Gentoo Foundation

EAPI=4
USE_RUBY="ruby21 ruby22 ruby23 ruby24 jruby"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.rdoc README.rdoc"

RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Ruby/Graphviz provides an interface to layout and generate images of directed graphs in a variety of formats (PostScript, PNG, etc.) using GraphViz"
HOMEPAGE="http://github.com/glejeune/Ruby-Graphviz"

LICENSE="as-is"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"
SLOT="0"

RDEPEND="${RDEPEND}
media-gfx/graphviz"

#all_ruby_prepare() {
#	# Existing metadata causes a crash in jruby, so use our own.
#	rm ../metadata || die "Unable to remove metadata."
#}
#
#each_ruby_test() {
#	${RUBY} -Ctest test_gnuplot.rb || die
#}
