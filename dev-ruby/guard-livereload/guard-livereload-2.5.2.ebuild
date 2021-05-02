# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Guard::LiveReload automatically reloads your browser when 'view' files are modified"
HOMEPAGE="https://rubygems.org/gems/guard-livereload"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/guard-2.8"
ruby_add_rdepend ">=dev-ruby/guard-compat-1.0"
ruby_add_rdepend ">=dev-ruby/em-websocket-0.5"
ruby_add_rdepend ">=dev-ruby/multi_json-1.8"
ruby_add_rdepend ">=dev-ruby/bundler-1.3.5"

