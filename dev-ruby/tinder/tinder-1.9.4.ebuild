# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby API for interfacing with Campfire, the 37Signals chat application"
HOMEPAGE="http://github.com/collectiveidea/tinder"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0"
ruby_add_rdepend ">=dev-ruby/faraday-0.8.9"
ruby_add_rdepend ">=dev-ruby/faraday_middleware-0.9"
ruby_add_rdepend ">=dev-ruby/hashie-1.0"
ruby_add_rdepend ">=dev-ruby/json-1.8.0"
ruby_add_rdepend ">=dev-ruby/mime-types-1.19"
ruby_add_rdepend ">=dev-ruby/multi_json-1.7"
ruby_add_rdepend ">=dev-ruby/twitter-stream-0.1"

