# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Xiki does what shell consoles do, but lets you edit everything at any time"
HOMEPAGE="http://xiki.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0"
ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/method_source-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-0"
ruby_add_rdepend ">=dev-ruby/net-scp-0"
ruby_add_rdepend ">=dev-ruby/net-sftp-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/trogdoro-el4r-1.0.7"
ruby_add_rdepend ">=dev-ruby/sexp_processor-0"
ruby_add_rdepend ">=dev-ruby/file-tail-0"
ruby_add_rdepend ">=dev-ruby/ruby_parser-0"
ruby_add_rdepend ">=dev-ruby/sourcify-0"
ruby_add_rdepend ">=dev-ruby/daemons-0"

