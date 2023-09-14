# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Colour-related toolset"
HOMEPAGE="http://rubygems.org/gems/colours"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cliner-1.0.4"
ruby_add_rdepend ">=dev-ruby/html_colours-1.0.1"
ruby_add_rdepend ">=dev-ruby/ansi_colours-1.0.6"

