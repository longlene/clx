# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A command-line power tool for Twitter"
HOMEPAGE="http://sferik.github.com/t/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/launchy-2.4"
ruby_add_rdepend ">=dev-ruby/geokit-1.9"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.3"
ruby_add_rdepend ">=dev-ruby/oauth-0.5.1"
ruby_add_rdepend ">=dev-ruby/retryable-2.0"
ruby_add_rdepend "<dev-ruby/thor-0.19.1"
ruby_add_rdepend ">=dev-ruby/twitter-6.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"

