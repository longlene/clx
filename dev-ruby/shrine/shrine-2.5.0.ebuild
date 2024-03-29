# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Shrine is a toolkit for file attachments in Ruby applications"
HOMEPAGE="https://github.com/janko-m/shrine"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/down-2.3.6"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-1.3.0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/rack-test_app-0"
ruby_add_rdepend ">=dev-ruby/dotenv-0"
ruby_add_rdepend ">=dev-ruby/shrine-memory-0.2.2"
ruby_add_rdepend ">=dev-ruby/roda-0"
ruby_add_rdepend ">=dev-ruby/rack-1.6.4"
ruby_add_rdepend ">=dev-ruby/mimemagic-0"
ruby_add_rdepend ">=dev-ruby/mime-types-0"
ruby_add_rdepend ">=dev-ruby/fastimage-0"
ruby_add_rdepend ">=dev-ruby/aws-sdk-2.1"
ruby_add_rdepend ">=dev-ruby/ruby-filemagic-0.7"
ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

