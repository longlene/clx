# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Wicked PDF uses the shell utility wkhtmltopdf to serve a PDF file to a user from HTML"
HOMEPAGE="https://github.com/mileszs/wicked_pdf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"

