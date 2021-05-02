# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple POP3 and SMTP implementation in EventMachine for use in the Rubot framework"
HOMEPAGE="https://github.com/chrislee35/eventmachine-email_server/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.10"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.6"
ruby_add_rdepend ">=dev-ruby/ratelimit-bucketbased-0.0.1"
ruby_add_rdepend ">=dev-ruby/eventmachine-dnsbl-0.0.2"
ruby_add_rdepend ">=dev-ruby/spf-0.0.44"
ruby_add_rdepend ">=dev-ruby/minitest-5.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

