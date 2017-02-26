# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby interface to the Twitter API"
HOMEPAGE="http://sferik.github.com/twitter/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.5"
ruby_add_rdepend ">=dev-ruby/buftok-0.2.0"
ruby_add_rdepend "=dev-ruby/equalizer-0.0.11"
ruby_add_rdepend ">=dev-ruby/faraday-0.11.0"
ruby_add_rdepend ">=dev-ruby/http-2.1"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.6.0"
ruby_add_rdepend ">=dev-ruby/memoizable-0.4.2"
ruby_add_rdepend ">=dev-ruby/naught-1.1"
ruby_add_rdepend ">=dev-ruby/simple_oauth-0.3.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"

