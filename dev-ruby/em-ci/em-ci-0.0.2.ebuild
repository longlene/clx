# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Utility library for monitoring CI servers"
HOMEPAGE="https://github.com/billiam/em-ci"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-1.0.3"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0.3"
ruby_add_rdepend ">=dev-ruby/em-promise-1.1.1"
ruby_add_rdepend ">=dev-ruby/ox-1.9.4"

