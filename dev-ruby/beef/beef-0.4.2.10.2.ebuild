# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The Browser Exploitation Framework (BeEF) is a security tool that provides practical client side attack vectors"
HOMEPAGE="http://beefproject.com"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/eventmachine"
ruby_add_rdepend "dev-ruby/thin"
ruby_add_rdepend "dev-ruby/sinatra"
ruby_add_rdepend ">=dev-ruby/rack-1.6.5"
ruby_add_rdepend ">=dev-ruby/rack-protection-2.0.1"
ruby_add_rdepend "dev-ruby/em-websocket"
ruby_add_rdepend "dev-ruby/uglifier"
ruby_add_rdepend "dev-ruby/mime-types"
ruby_add_rdepend "dev-ruby/execjs"
ruby_add_rdepend ">=dev-ruby/ansi-0"
ruby_add_rdepend ">=dev-ruby/term-ansicolor-0"
ruby_add_rdepend ">=dev-ruby/dm-core-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/data_objects-0"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.2.1"
ruby_add_rdepend ">=dev-ruby/espeak-ruby-1.0.4"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.7"
ruby_add_rdepend ">=dev-ruby/therubyracer-0.12.3"

ruby_add_rdepend ">=dev-ruby/do_sqlite3-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-0"
ruby_add_rdepend ">=dev-ruby/parseconfig-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-0"

