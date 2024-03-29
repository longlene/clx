# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An extensible Ruby wrapper for Atom and RSS parsers"
HOMEPAGE="http://github.com/aasmith/feed-normalizer"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/simple-rss-1.1"
ruby_add_rdepend ">=dev-ruby/hpricot-0.6"
ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.3"
ruby_add_rdepend ">=dev-ruby/gemcutter-0.3.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.5.0"

