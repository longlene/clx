# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Shrine is a toolkit for handling file uploads in Ruby"
HOMEPAGE="https://github.com/janko-m/shrine"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/down-2.3.4"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-1.3.0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/webmock-0"
ruby_add_rdepend ">=dev-ruby/rack-test_app-0"
ruby_add_rdepend ">=dev-ruby/dotenv-0"
ruby_add_rdepend ">=dev-ruby/shrine-memory-0.2.1"
ruby_add_rdepend ">=dev-ruby/roda-0"
ruby_add_rdepend ">=dev-ruby/mimemagic-0"
ruby_add_rdepend ">=dev-ruby/mime-types-0"
ruby_add_rdepend ">=dev-ruby/fastimage-0"
ruby_add_rdepend ">=dev-ruby/aws-sdk-0"
ruby_add_rdepend ">=dev-ruby/ruby-filemagic-0.7"
ruby_add_rdepend ">=dev-ruby/sequel-0"
ruby_add_rdepend ">=dev-ruby/activerecord-4.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

