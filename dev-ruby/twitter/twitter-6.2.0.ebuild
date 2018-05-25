# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby interface to the Twitter API"
HOMEPAGE="http://sferik.github.com/twitter/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.3"
ruby_add_rdepend ">=dev-ruby/buftok-0.2.0"
ruby_add_rdepend ">=dev-ruby/equalizer-0.0.11"
ruby_add_rdepend ">=dev-ruby/http-3.0"
ruby_add_rdepend ">=dev-ruby/http-form_data-2.0"
ruby_add_rdepend ">=dev-ruby/http_parser_rb-0.6.0"
ruby_add_rdepend ">=dev-ruby/memoizable-0.4.0"
ruby_add_rdepend ">=dev-ruby/multipart-post-2.0"
ruby_add_rdepend ">=dev-ruby/naught-1.0"
ruby_add_rdepend ">=dev-ruby/simple_oauth-0.3.0"
