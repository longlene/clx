# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Asynchronous WHOIS queries via EventMachine (based on synchronous whois gem)"
HOMEPAGE="http://github.com/mikejarema/em-whois"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/em-synchrony-0"
ruby_add_rdepend "=dev-ruby/whois-2.7.0"

