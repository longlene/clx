# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Converts source code into a (bookmarked, themed, and syntax highlighted!) PDF"
HOMEPAGE="http://code-rippa.heroku.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/psych-2.0"
ruby_add_rdepend ">=dev-ruby/ansi-1.4"
ruby_add_rdepend ">=dev-ruby/color-1.5"
ruby_add_rdepend ">=dev-ruby/language_sniffer-1.0"
ruby_add_rdepend ">=dev-ruby/ptools-1.2"
ruby_add_rdepend ">=dev-ruby/rainbow-2.0"
ruby_add_rdepend ">=dev-ruby/spox-ultraviolet-0.10"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.2"

