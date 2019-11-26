# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Execute shell commands, authorizing them against a vines-services access control list"
HOMEPAGE="http://www.getvines.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/blather-0.8.5"
ruby_add_rdepend ">=dev-ruby/ohai-0.6.10"
ruby_add_rdepend ">=dev-ruby/session-3.1.0"
ruby_add_rdepend ">=dev-ruby/slave-1.3.0"
ruby_add_rdepend ">=dev-ruby/vines-0.4.6"
