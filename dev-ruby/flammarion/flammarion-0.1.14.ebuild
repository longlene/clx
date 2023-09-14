# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The nifty Ruby gui toolkit"
HOMEPAGE="https://github.com/zach-capalbo/flammarion"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubame-0.0.2"
ruby_add_rdepend ">=dev-ruby/colorize-0.7"
ruby_add_rdepend ">=dev-ruby/filewatcher-0.5"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"
ruby_add_rdepend ">=dev-ruby/websocket-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/middleman-3.3"
ruby_add_rdepend ">=dev-ruby/faker-0"
ruby_add_rdepend ">=dev-ruby/gemojione-0"

